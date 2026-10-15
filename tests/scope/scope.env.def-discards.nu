# id: scope.env.def-discards
# rule: scope.env.discarded
# expect: output
# ---
# orig
# ---
def set-foo [] { $env.FOO = 'set' }
$env.FOO = 'orig'
set-foo
$env.FOO
