# id: scope.env.each-discards
# rule: scope.env.discarded
# expect: output
# ---
# orig
# ---
$env.FOO = 'orig'
[1] | each { $env.FOO = 'changed' }
$env.FOO
