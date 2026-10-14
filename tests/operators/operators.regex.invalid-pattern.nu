# id: operators.regex.invalid-pattern
# rule: operators.regex.invalid
# expect: runtime-error
# error: nu::shell::invalid_value
"abc" =~ "["
