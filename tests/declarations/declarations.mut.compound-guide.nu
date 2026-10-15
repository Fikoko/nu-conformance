# id: declarations.mut.compound-guide
# rule: declarations.mut.binding
# expect: output
# ---
# 10
# ---
mut x = 0; $x += 5; $x *= 2; $x
