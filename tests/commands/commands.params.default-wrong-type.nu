# id: commands.params.default-wrong-type
# rule: commands.params.default-constant
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [x: int = "a"] { 1 }
