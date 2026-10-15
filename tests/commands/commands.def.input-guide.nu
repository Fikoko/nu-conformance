# id: commands.def.input-guide
# rule: commands.def.input
# expect: output
# ---
# 42
# ---
def double []: int -> int { $in * 2 }
21 | double
