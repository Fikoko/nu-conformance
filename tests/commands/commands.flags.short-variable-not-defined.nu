# id: commands.flags.short-variable-not-defined
# rule: commands.flags.short
# expect: parse-error
# error: nu::parser::variable_not_found
def greet [--age (-a): int] { $a }
