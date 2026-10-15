# id: commands.def.input-stored
# rule: commands.def.input
# expect: output
# ---
# [1, 2]
# ---
def keep [] { let start = $in; $start }
[1 2] | keep | to nuon
