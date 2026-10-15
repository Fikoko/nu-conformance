# id: commands.flags.user-help-ignored
# rule: commands.flags.help
# expect: output
# ---
# true
# ---
def f [--help] { 'mine' }
f --help | str contains 'Usage:'
