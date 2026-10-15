# id: scope.env.while-keeps
# rule: scope.env.kept
# expect: output
# ---
# changed
# ---
$env.FOO = 'orig'
mut i = 0
while $i < 1 { $env.FOO = 'changed'; $i += 1 }
$env.FOO
