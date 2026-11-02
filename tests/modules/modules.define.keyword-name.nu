# id: modules.define.keyword-name
# rule: modules.define.names
# expect: parse-error
# error: nu::parser::name_is_keyword
module m { export def let [] { 'x' } }
