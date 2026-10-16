# id: commands.sig.input-compound-mismatch
# rule: commands.sig.input
# expect: parse-error
# error: nu::parser::input_type_mismatch
def f []: list<int> -> int { length }
[a] | f
