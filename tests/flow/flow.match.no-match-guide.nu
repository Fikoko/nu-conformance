# id: flow.match.no-match-guide
# rule: flow.match.value
# expect: output
# ---
# nothing
# ---
match 42 { 1 => 'one' } | describe
