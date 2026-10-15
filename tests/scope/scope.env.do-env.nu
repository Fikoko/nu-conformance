# id: scope.env.do-env
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
do --env { $env.FOO = 'changed' }
$env.FOO
