# id: modules.define.named-as-module
# rule: modules.define.names
# expect: parse-error
# error: nu::parser::named_as_module
module m { export def m [] { 'x' } }
