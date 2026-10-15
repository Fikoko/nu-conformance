# id: commands.names.keyword-let
# rule: commands.names.keywords
# expect: parse-error
# error: nu::parser::name_is_keyword
def let [] { 'mine' }
