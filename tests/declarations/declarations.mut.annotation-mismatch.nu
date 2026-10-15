# id: declarations.mut.annotation-mismatch
# rule: declarations.mut.type
# expect: parse-error
# error: nu::parser::type_mismatch
mut x: int = 1.5
