# id: modules.use.whole-subcommands
# rule: modules.use.whole
# expect: output
# ---
# f
# ---
module m { export def f [] { 'f' } }
use m
m f
