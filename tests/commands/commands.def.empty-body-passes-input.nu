# id: commands.def.empty-body-passes-input
# rule: commands.def.result
# expect: output
# ---
# 5
# ---
def f [] { }
5 | f
