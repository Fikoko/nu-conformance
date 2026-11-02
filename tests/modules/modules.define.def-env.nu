# id: modules.define.def-env
# rule: modules.define.env
# expect: output
# ---
# bar
# ---
module m { export def --env go [] { $env.FOO = 'bar' } }
use m go
go
$env.FOO
