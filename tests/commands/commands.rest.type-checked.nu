# id: commands.rest.type-checked
# rule: commands.rest.collect
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [...n: int] { $n }
f 1 a
