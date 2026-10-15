# id: commands.names.keyword-where
# rule: commands.names.keywords
# expect: parse-error
# error: nu::parser::name_is_keyword
def where [] { 'mine' }
