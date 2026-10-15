# id: commands.flags.unknown
# rule: commands.flags.names
# expect: parse-error
# error: nu::parser::unknown_flag
def f [] { 1 }
f --nope
