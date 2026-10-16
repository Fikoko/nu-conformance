# id: commands.attr.unknown
# rule: commands.attr.unknown
# expect: parse-error
# error: nu::parser::unknown_command
null
@nosuch
def g [] { 1 }
