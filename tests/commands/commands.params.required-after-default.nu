# id: commands.params.required-after-default
# rule: commands.params.order
# expect: parse-error
# error: nu::parser::required_after_optional
def f [a = 1, b] { 1 }
