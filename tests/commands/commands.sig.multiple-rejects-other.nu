# id: commands.sig.multiple-rejects-other
# rule: commands.sig.declare
# expect: parse-error
# error: nu::parser::input_type_mismatch
def j []: [
  list -> string
  string -> string
] { "" }
1 | j
