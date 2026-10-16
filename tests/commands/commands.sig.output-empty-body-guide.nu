# id: commands.sig.output-empty-body-guide
# rule: commands.sig.output
# expect: parse-error
# error: nu::parser::output_type_mismatch
def f []: nothing -> list { }
