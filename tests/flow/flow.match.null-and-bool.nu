# id: flow.match.null-and-bool
# rule: flow.match.literals
# expect: output
# ---
# ["null", "true"]
# ---
[(match null { null => 'null', _ => 'x' }) (match true { true => 'true', _ => 'x' })] | to nuon
