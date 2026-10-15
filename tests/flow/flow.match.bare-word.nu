# id: flow.match.bare-word
# rule: flow.match.literals
# expect: output
# ---
# foo
# ---
match 'foo' { foo => 'foo', _ => 'other' }
