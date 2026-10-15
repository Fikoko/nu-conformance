# id: flow.match.literal-types-guide
# rule: flow.match.literals
# expect: output
# ---
# string
# ---
match "3" { 3 => 'int', "3" => 'string' }
