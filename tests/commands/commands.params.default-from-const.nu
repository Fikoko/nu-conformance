# id: commands.params.default-from-const
# rule: commands.params.default-constant
# expect: output
# ---
# 5
# ---
const d = 5
def f [x = $d] { $x }
f
