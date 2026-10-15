# id: scope.env.do-discards-guide
# rule: scope.env.discarded
# expect: output
# ---
# inner
# outer
# ---
$env.FOO = 'outer'
do { $env.FOO = 'inner'; print $env.FOO }
$env.FOO
