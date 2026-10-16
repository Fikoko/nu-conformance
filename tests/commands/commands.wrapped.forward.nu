# id: commands.wrapped.forward
# rule: commands.wrapped.rest
# expect: output
# ---
# [-x, y]
# ---
def show [...args] { $args }
def --wrapped w [...rest] { show -- ...$rest }
w -x y | to nuon
