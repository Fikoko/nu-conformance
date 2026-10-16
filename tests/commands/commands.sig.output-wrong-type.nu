# id: commands.sig.output-wrong-type
# rule: commands.sig.output
# expect: parse-error
# error: nu::parser::output_type_mismatch
def f []: int -> string { $in }
