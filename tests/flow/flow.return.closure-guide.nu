# id: flow.return.closure-guide
# rule: flow.return.scope
# expect: output
# ---
# [positive, non-positive]
# ---
let check = {|n| if $n > 0 { return 'positive' }; 'non-positive' }
[(do $check 3) (do $check (-3))] | to nuon
