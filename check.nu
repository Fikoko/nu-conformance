#!/usr/bin/env nu
# Checks that rules and tests point at each other correctly.
#
# Fails on: malformed or duplicate rule IDs, and tests that reference rules
# that don't exist. Rules without tests are listed but don't fail the check,
# since full coverage is a goal, not a requirement.

use lib/test-format.nu *

# Check rule IDs and the links between rules and tests.
def main [
    --list-untested (-u)    # list every rule that has no test
] {
    let root = $env.FILE_PWD
    cd $root

    let rules = glob 'rules/*.md' | sort | each {|f| rules-in $f } | flatten
    let tests = test-files $root | each {|f|
        {id: ($f | path parse | get stem), rules: (parse-header $f).rule}
    }

    mut errors = []

    for r in ($rules | where {|r| not (valid-rule-id $r.id) }) {
        $errors = $errors | append $"malformed rule ID `($r.id)` at ($r.file | path relative-to $root):($r.line)"
    }
    for d in ($rules | group-by id | transpose id defs | where { ($in.defs | length) > 1 }) {
        let places = $d.defs | each { $"($in.file | path relative-to $root):($in.line)" } | str join ', '
        $errors = $errors | append $"rule `($d.id)` is defined more than once: ($places)"
    }

    let known = $rules | get --optional id | default []
    for t in $tests {
        for rule in ($t.rules | where { $in not-in $known }) {
            $errors = $errors | append $"test `($t.id)` references unknown rule `($rule)`"
        }
    }

    # As in the Rust Reference, tests should name the most specific rule.
    # A rule with more specific rules under it counts as covered when any of
    # them is tested.
    let tested = $tests | get --optional rules | default [] | flatten | uniq
    let untested = $known | where {|r|
        not ($tested | any {|t| $t == $r or ($t starts-with $"($r).") })
    }
    mut warnings = []
    for t in $tests {
        for rule in $t.rules {
            if ($known | any { $in starts-with $"($rule)." }) {
                $warnings = $warnings | append $"test `($t.id)` references `($rule)`, which has more specific rules; use one of those"
            }
        }
    }

    for e in $errors { print $"(ansi red)error:(ansi reset) ($e)" }
    for w in $warnings { print $"(ansi yellow)warning:(ansi reset) ($w)" }
    if $list_untested {
        for u in $untested { print $"(ansi yellow)untested:(ansi reset) ($u)" }
    }

    let covered = ($known | length) - ($untested | length)
    print $"($known | length) rules, ($tests | length) tests, ($covered) rules covered, ($untested | length) without tests"

    if $errors != [] { exit 1 }
}
