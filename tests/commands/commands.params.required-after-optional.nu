# id: commands.params.required-after-optional
# rule: commands.params.order
# expect: parse-error
# error: nu::parser::required_after_optional
def f [a?, b] { 1 }
