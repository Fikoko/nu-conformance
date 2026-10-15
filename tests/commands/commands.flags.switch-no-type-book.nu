# id: commands.flags.switch-no-type-book
# rule: commands.flags.switch
# expect: parse-error
# error: nu::parser::error
def greet [
    --caps: bool   # Not allowed
] { $caps }
