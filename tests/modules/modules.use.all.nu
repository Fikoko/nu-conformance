# id: modules.use.all
# rule: modules.use.all
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
use m *
f
