# id: types.list.extra-close-bracket
# rule: types.list.extra-close
# expect: parse-error
# error: nu::parser::unbalanced_delimiter
[1 2]] | to nuon
