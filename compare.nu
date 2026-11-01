#!/usr/bin/env nu
# Runs the suite twice against the same Nushell binary, once with the default
# parser and once with an experimental option such as the winnow parser, and
# lists the tests whose results differ. Any difference is a bug in one of the
# two parsers, or a test that depends on parser details.
#
# The binary under test comes from NU_BIN, as for run.nu.

# Compare the default parser with an experimental parser.
def main [
    --option: string = 'winnow-parser'   # experimental option to compare against
    --markdown                           # print the report as Markdown
] {
    let root = $env.FILE_PWD
    let run = $root | path join run.nu
    let nu_bin = $env.NU_BIN? | default $nu.current-exe

    let base = ^$nu.current-exe $run --json | from json
    let other = ^$nu.current-exe $run --json --option $option | from json

    let joined = $base | join --left ($other | select id status reason | rename id status_option reason_option) id
    let diffs = $joined | where status != $it.status_option or reason != $it.reason_option
    let version = ^$nu_bin --version | str trim

    if $markdown {
        print $"## Default parser vs `($option)`\n"
        print $"Nushell ($version), ($base | length) tests, ($diffs | length) with different results.\n"
        if $diffs != [] {
            print '| Test | Default parser | `' + $option + '` |'
            print '|---|---|---|'
            for d in $diffs {
                print $"| `($d.id)` | (cell $d.status $d.reason) | (cell $d.status_option $d.reason_option) |"
            }
        }
    } else {
        print $"Nushell ($version): default parser vs ($option)"
        print $"($base | length) tests, ($diffs | length) with different results\n"
        for d in $diffs {
            print $"($d.id)"
            print $"    default:   (cell $d.status $d.reason)"
            print $"    ($option): (cell $d.status_option $d.reason_option)"
        }
    }

    if $diffs != [] { exit 1 }
}

def cell [status: string, reason: string]: nothing -> string {
    let r = $reason | str replace --all '|' '\|' | str replace --all "\n" ' '
    if $r == '' { $status } else { $"($status): ($r)" }
}
