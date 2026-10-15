# id: scope.env.for-keeps
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
for i in [1] { $env.FOO = 'changed' }
$env.FOO
