# id: modules.use.shadow-def-later
# rule: modules.use.shadow
# expect: output
# ---
# local
# ---
module m { export def f [] { 'm' } }
use m f
def f [] { 'local' }
f
