# id: commands.flags.user-help-error
# rule: commands.flags.help
# expect: parse-error
# error: nu::parser::error
def f [--help] { 'mine' }
f --help | str contains 'Usage:'
