# id: commands.names.keyword-def
# rule: commands.names.keywords
# expect: parse-error
# error: nu::parser::name_is_keyword
def def [] { 'mine' }
