# id: modules.hide.before
# rule: modules.hide.command
# expect: output
# ---
# f
# ---
def f [] { 'f' }
let r = f
hide f
$r
