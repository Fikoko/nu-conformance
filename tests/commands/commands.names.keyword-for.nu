# id: commands.names.keyword-for
# rule: commands.names.keywords
# expect: parse-error
# error: nu::parser::name_is_keyword
def for [] { 'mine' }
