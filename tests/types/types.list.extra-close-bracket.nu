# id: types.list.extra-close-bracket
# rule: types.list.extra-close
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
# status: pending
[1 2]] | to nuon
