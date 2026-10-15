# id: declarations.const.annotation
# rule: declarations.const.immutable
# expect: parse-error
# error: nu::parser::type_mismatch
const x: int = "a"
