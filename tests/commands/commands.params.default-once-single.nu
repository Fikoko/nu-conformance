# id: commands.params.default-once-single
# rule: commands.params.default-once
# expect: output
# ---
# 1
# ---
def cmd [a = 1] { $a }
cmd
