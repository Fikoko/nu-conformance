# id: commands.wrapped.collects-flags
# rule: commands.wrapped.rest
# expect: output
# ---
# [-l, --foo, bar]
# ---
def --wrapped w [...rest] { $rest }
w -l --foo bar | to nuon
