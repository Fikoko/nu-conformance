# id: flow.match.range
# rule: flow.match.literals
# expect: output
# ---
# [medium, open, exclusive-no]
# ---
[(match 5 { 4..10 => 'medium', _ => 'x' }) (match 100 { 5.. => 'open', _ => 'x' }) (match 5 { 1..<5 => 'exclusive', _ => 'exclusive-no' })] | to nuon
