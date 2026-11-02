# id: modules.use.names-list
# rule: modules.use.names
# expect: output
# ---
# 3
# ---
module m { export def f [] { 1 }; export def g [] { 2 } }
use m [f g]
(f) + (g)
