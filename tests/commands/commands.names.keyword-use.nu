# id: commands.names.keyword-use
# rule: commands.names.keywords
# expect: parse-error
# error: nu::parser::name_is_keyword
def use [] { 'mine' }
