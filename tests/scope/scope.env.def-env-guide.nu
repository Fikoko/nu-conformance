# id: scope.env.def-env-guide
# rule: scope.env.kept
# expect: output
# ---
# set in def --env
# ---
def --env set-foo [] { $env.FOO = 'set in def --env' }
set-foo
$env.FOO
