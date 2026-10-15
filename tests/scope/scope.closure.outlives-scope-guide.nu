# id: scope.closure.outlives-scope-guide
# rule: scope.closure.capture
# expect: output
# ---
# 42
# ---
let c = do { let secret = 42; {|| $secret } }; do $c
