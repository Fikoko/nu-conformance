# id: commands.params.type-mismatch-guide
# rule: commands.params.types
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [x: int] { $x }; f "a"
