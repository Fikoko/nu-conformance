# id: commands.closure.parameter-guide
# rule: commands.closure.parameter
# expect: output
# ---
# 40
# ---
def apply [f: closure, value] { do $f $value }
apply {|v| $v * 10 } 4
