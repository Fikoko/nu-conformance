# id: commands.params.type-mismatch-book
# rule: commands.params.types
# expect: parse-error
# error: nu::parser::parse_mismatch
def greet [name: int] {
  $"hello ($name)"
}
greet World
