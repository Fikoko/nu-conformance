# id: commands.sig.full-parameter-guide
# rule: commands.sig.flags
# expect: output
# ---
# 9
# ---
def fully [some?: int = 9] { $some }
fully
