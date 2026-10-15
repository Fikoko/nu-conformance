# id: declarations.const.no-assign
# rule: declarations.const.immutable
# expect: parse-error
# error: nu::parser::assignment_requires_mutable_variable
const x = 1; $x = 2
