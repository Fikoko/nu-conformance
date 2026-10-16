# id: commands.wrapped.keeps-double-dash
# rule: commands.wrapped.rest
# expect: output
# ---
# [-l, --, x]
# ---
def --wrapped w [...rest] { $rest }
w -l -- x | to nuon
