# id: commands.wrapped.strings
# rule: commands.wrapped.rest
# expect: output
# ---
# [-l, "5"]
# ---
def --wrapped w [...rest: string] { $rest }
w -l 5 | to nuon
