# id: declarations.mut.type-fixed-guide
# rule: declarations.mut.type
# expect: parse-error
# error: nu::parser::operator_incompatible_types
mut x = 1; $x = "a"
