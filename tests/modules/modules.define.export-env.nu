# id: modules.define.export-env
# rule: modules.define.env
# expect: output
# ---
# from-env
# ---
module m { export-env { $env.FOO = 'from-env' } }
use m
$env.FOO
