# id: modules.use.shadow-use-later
# rule: modules.use.shadow
# expect: output
# ---
# m
# ---
module m { export def f [] { 'm' } }
def f [] { 'local' }
use m f
f
