# id: scope.env.closure-reads-at-call
# rule: scope.env.read-at-run
# expect: output
# ---
# b
# ---
$env.FOO = 'a'
let c = {|| $env.FOO }
$env.FOO = 'b'
do $c
