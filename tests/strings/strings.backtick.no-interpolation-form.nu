# id: strings.backtick.no-interpolation-form
# rule: strings.backtick.no-interpolation-form
# expect: parse-error
# error: nu::parser::variable_not_found
$`a`
