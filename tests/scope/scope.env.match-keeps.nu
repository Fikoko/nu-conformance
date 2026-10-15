# id: scope.env.match-keeps
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
match 1 { _ => { $env.FOO = 'changed' } }
$env.FOO
