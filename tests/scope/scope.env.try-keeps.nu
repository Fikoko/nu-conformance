# id: scope.env.try-keeps
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
try { $env.FOO = 'changed' }
$env.FOO
