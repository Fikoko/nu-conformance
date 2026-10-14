# id: operators.bool.andand
# rule: operators.bool.shell-syntax
# expect: parse-error
# error: nu::parser::shell_andand
true && false
