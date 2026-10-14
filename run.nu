#!/usr/bin/env nu
# Runs the conformance tests against a Nushell binary.
#
# The binary under test comes from NU_BIN; if it is not set, the `nu` running
# this script is tested. See CONTRIBUTING.md for the test format.

use lib/test-format.nu *

# Run conformance tests and report the results.
def main [
    filter?: string     # only run tests whose ID contains this text
    --verbose (-v)      # also list passing and skipped tests
] {
    let root = $env.FILE_PWD
    let nu_bin = $env.NU_BIN? | default $nu.current-exe
    let os = $nu.os-info.name

    let tested_version = ^$nu_bin --version | str trim
    let pinned = open --raw ($root | path join NU_VERSION) | str trim
    print $"Testing ($nu_bin) \(version ($tested_version)) on ($os)"
    if $tested_version != $pinned {
        print $"(ansi yellow)warning:(ansi reset) the suite targets ($pinned), results may differ"
    }
    print ''

    let results = test-files $root
    | where {|f| ($filter == null) or (($f | path parse | get stem) | str contains $filter) }
    | each {|path| check-test $nu_bin $os $path }

    let shown = if $verbose { $results } else { $results | where status not-in [pass skip] }
    for r in $shown { print-result $r }

    let counts = [pass fail pending skip invalid] | each {|s|
        {status: $s, count: ($results | where status == $s | length)}
    }
    if $shown != [] { print '' }
    print ($counts | where count > 0 | each { $"($in.count) ($in.status)" } | str join ', ')

    if ($results | any { $in.status in [fail invalid] }) { exit 1 }
}

# Run one test file and classify the result.
def check-test [nu_bin: string, os: string, path: path]: nothing -> record {
    let id = $path | path parse | get stem
    let h = parse-header $path

    let problems = validate-header $path $h
    if $problems != [] {
        return {id: $id, status: invalid, reason: ($problems | str join '; ')}
    }
    if $os not-in (platforms-of $h) {
        return {id: $id, status: skip, reason: $"not run on ($os)"}
    }

    let run = run-isolated $nu_bin $path $h.expect
    let verdict = judge $h $run
    let pending = ($h.status? | default 'active') == 'pending'

    match [$pending, $verdict.ok] {
        [false, true] => {id: $id, status: pass, reason: ''}
        [false, false] => {id: $id, status: fail, reason: $verdict.reason, detail: $verdict.detail}
        [true, true] => {id: $id, status: pending, reason: 'passes now; consider marking it active'}
        [true, false] => {id: $id, status: pending, reason: $verdict.reason}
    }
}

# Run a test in a fresh temporary directory, without user config.
def run-isolated [nu_bin: string, path: path, expect: string]: nothing -> record {
    let script = $path | path expand
    let tmp = mktemp --directory
    let run = do {
        cd $tmp
        with-env {NO_COLOR: '1'} {
            if $expect == 'parses' {
                ^$nu_bin --no-config-file -c $"nu-check --debug ($script | to nuon)" | complete
            } else {
                ^$nu_bin --no-config-file --error-style plain $script | complete
            }
        }
    }
    rm --recursive --force $tmp
    $run
}

# Compare a run against what the test expects.
def judge [h: record, run: record]: nothing -> record {
    let out = $run.stdout | normalize
    let code = $run.stderr
    | parse --regex 'Error: (?<code>nu::[A-Za-z0-9_:]+)'
    | get --optional 0.code
    let failed = $run.exit_code != 0
    let wanted_code = $h.error? | default ''
    let stderr_tail = $run.stderr | normalize | lines | first 5 | str join "\n"

    match $h.expect {
        'output' => {
            if $failed {
                {ok: false, reason: $"exited with code ($run.exit_code)", detail: $stderr_tail}
            } else if $out != ($h.expected | normalize) {
                {ok: false, reason: 'output differs', detail: $"expected:\n($h.expected)\nactual:\n($out)"}
            } else { {ok: true} }
        }
        'parses' => {
            if $failed or $out != 'true' {
                {ok: false, reason: 'does not parse', detail: $stderr_tail}
            } else { {ok: true} }
        }
        $kind => {
            let is_parse = $code != null and ($code starts-with 'nu::parser::')
            let is_compile = $code != null and ($code starts-with 'nu::compile::')
            if not $failed {
                {ok: false, reason: 'expected an error, but the script succeeded', detail: $out}
            } else if $code == null {
                {ok: false, reason: 'failed without an error code', detail: $stderr_tail}
            } else if $kind == 'parse-error' and not $is_parse {
                {ok: false, reason: $"expected a parse error, got ($code)", detail: ''}
            } else if $kind == 'compile-error' and not $is_compile {
                {ok: false, reason: $"expected a compile error, got ($code)", detail: ''}
            } else if $kind == 'runtime-error' and ($is_parse or $is_compile) {
                {ok: false, reason: $"expected a runtime error, got ($code)", detail: ''}
            } else if $wanted_code != '' and $code != $wanted_code {
                {ok: false, reason: $"expected ($wanted_code), got ($code)", detail: ''}
            } else { {ok: true} }
        }
    }
}

# Normalize line endings and drop trailing newlines.
def normalize []: string -> string {
    str replace --all "\r\n" "\n" | str replace --regex '\n+$' ''
}

def print-result [r: record] {
    let color = match $r.status {
        pass => (ansi green)
        fail | invalid => (ansi red)
        pending => (ansi yellow)
        _ => (ansi default_dimmed)
    }
    let reason = if $r.reason == '' { '' } else { $" — ($r.reason)" }
    print $"($color)($r.status | fill --width 8)(ansi reset) ($r.id)($reason)"
    let detail = $r.detail? | default ''
    if $detail != '' {
        print ($detail | lines | each { $"         ($in)" } | str join "\n")
    }
}
