# id: commands.flags.help-is-builtin
# rule: commands.flags.help
# expect: output
# ---
# true
# ---
def f [] { 1 }
f -h | str contains 'Usage:'
