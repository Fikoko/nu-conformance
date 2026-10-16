# id: commands.sig.input-mismatch-book
# rule: commands.sig.input
# expect: parse-error
# error: nu::parser::input_type_mismatch
def inc []: int -> int { $in + 1 }
"Hi" | inc
