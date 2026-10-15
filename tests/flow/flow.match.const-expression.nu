# id: flow.match.const-expression
# rule: flow.match.constants
# expect: output
# ---
# yes
# ---
match 42 { (40 + 2) => 'yes', _ => 'no' }
