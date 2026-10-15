# id: commands.def.input-type-guide
# rule: commands.def.input
# expect: parse-error
# error: nu::parser::input_type_mismatch
def double []: int -> int { $in * 2 }; "a" | double
