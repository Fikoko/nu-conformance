# id: commands.names.keyword-if
# rule: commands.names.keywords
# expect: parse-error
# error: nu::parser::name_is_keyword
def if [] { 'mine' }
