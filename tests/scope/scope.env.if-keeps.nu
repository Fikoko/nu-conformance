# id: scope.env.if-keeps
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
if true { $env.FOO = 'changed' }
$env.FOO
