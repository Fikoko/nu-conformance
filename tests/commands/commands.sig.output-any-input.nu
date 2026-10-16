# id: commands.sig.output-any-input
# rule: commands.sig.output
# expect: parse-error
# error: nu::parser::output_type_mismatch
def f []: any -> int { "a" }
