# id: flow.return.from-match
# rule: flow.return.scope
# expect: output
# ---
# two
# ---
def f [x] { match $x { 2 => { return 'two' }, _ => {} }; 'other' }
f 2
