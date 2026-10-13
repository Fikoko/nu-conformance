# Shared helpers for reading conformance tests and rule files.
# See CONTRIBUTING.md for the formats.

export const EXPECT_VALUES = [output parse-error runtime-error parses]
export const PLATFORMS = [linux macos windows]

# Read the comment header at the top of a test file.
#
# Returns a record with the header fields, `rule` as a list (the field may
# appear more than once), `expected` (the text between the `# ---` lines) and
# `has_block` (whether such a block was present).
export def parse-header [path: path]: nothing -> record {
    mut fields = {rule: []}
    mut expected = []
    mut block = 'before'   # before, inside, after

    for line in (open --raw $path | lines) {
        if not ($line starts-with '#') { break }
        let body = $line | str replace --regex '^# ?' ''

        if $body == '---' {
            $block = if $block == 'before' { 'inside' } else { 'after' }
            continue
        }
        if $block == 'inside' {
            $expected = $expected | append $body
            continue
        }

        let m = $body | parse --regex '^(?<key>[a-z-]+):\s*(?<value>.*)$'
        if ($m | is-empty) { continue }
        let key = $m.0.key
        let value = $m.0.value | str trim
        if $key == 'rule' {
            $fields.rule = $fields.rule | append $value
        } else {
            $fields = $fields | upsert $key $value
        }
    }

    $fields
    | upsert expected ($expected | str join "\n")
    | upsert has_block ($block != 'before')
}

# Check a parsed header for mistakes. Returns a list of problems (empty if valid).
export def validate-header [path: path, h: record]: nothing -> list<string> {
    mut problems = []
    let stem = $path | path parse | get stem

    for field in [id expect] {
        if ($h | get --optional $field | is-empty) {
            $problems = $problems | append $"missing `($field)`"
        }
    }
    if ($h.rule | is-empty) { $problems = $problems | append 'missing `rule`' }

    let id = $h.id? | default ''
    if $id != '' and $id != $stem {
        $problems = $problems | append $"id `($id)` does not match file name `($stem)`"
    }

    let expect = $h.expect? | default ''
    if $expect != '' and $expect not-in $EXPECT_VALUES {
        $problems = $problems | append $"unknown expect value `($expect)`"
    }
    if $expect == 'output' and not $h.has_block {
        $problems = $problems | append 'expect: output needs an expected-output block'
    }
    if $expect in [parse-error runtime-error] and $h.has_block {
        $problems = $problems | append 'error tests must not have an expected-output block'
    }
    if ($h.error? | is-not-empty) and $expect not-in [parse-error runtime-error] {
        $problems = $problems | append '`error` is only allowed in error tests'
    }

    for p in (platforms-of $h) {
        if $p not-in $PLATFORMS {
            $problems = $problems | append $"unknown platform `($p)`"
        }
    }

    let status = $h.status? | default 'active'
    if $status not-in [active pending] {
        $problems = $problems | append $"unknown status `($status)`"
    }

    $problems
}

# The platforms a test runs on.
export def platforms-of [h: record]: nothing -> list<string> {
    let raw = $h.platforms? | default 'all' | str trim
    if $raw == 'all' {
        $PLATFORMS
    } else {
        $raw | split row ',' | each { str trim } | where { is-not-empty }
    }
}

# All rule IDs defined in a rules file, with their line numbers.
# A rule's label comes at the end of its text, in code style:
#   **Defined.** Some rule text. `[some.rule.id]`
export def rules-in [path: path]: nothing -> table {
    open --raw $path
    | lines
    | enumerate
    | each {|row|
        let m = $row.item | str trim | parse --regex '`\[(?<id>[A-Za-z0-9][A-Za-z0-9_.-]*\.[A-Za-z0-9_.-]+)\]`$'
        if ($m | is-empty) { null } else { {id: $m.0.id, file: $path, line: ($row.index + 1)} }
    }
    | compact
}

# Whether a rule ID follows the naming convention.
export def valid-rule-id [id: string]: nothing -> bool {
    $id =~ '^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9_]+(-[a-z0-9_]+)*)*$'
}

# Find all test files under a directory.
export def test-files [root: path]: nothing -> list<path> {
    cd $root
    glob 'tests/**/*.nu' | sort
}
