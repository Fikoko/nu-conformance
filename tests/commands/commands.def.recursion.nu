# id: commands.def.recursion
# rule: commands.def.basic
# expect: output
# ---
# 120
# ---
def fact [n] { if $n <= 1 { 1 } else { $n * (fact ($n - 1)) } }
fact 5
