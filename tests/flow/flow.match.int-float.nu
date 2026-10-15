# id: flow.match.int-float
# rule: flow.match.literals
# expect: output
# ---
# ["int one", "float one"]
# ---
[(match 1.0 { 1 => 'int one', _ => 'other' }) (match 1 { 1.0 => 'float one', _ => 'other' })] | to nuon
