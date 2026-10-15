# id: scope.env.catch-keeps
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
try { error make {msg: x} } catch { $env.FOO = 'changed' }
$env.FOO
