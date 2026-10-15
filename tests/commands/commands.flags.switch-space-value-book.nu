# id: commands.flags.switch-space-value-book
# rule: commands.flags.switch
# expect: parse-error
# error: nu::parser::extra_positional
def greet [
  name: string
  --caps
] {
    let greeting = $"Hello, ($name)!"
    if $caps {
      $greeting | str uppercase
    } else {
      $greeting
    }
}
greet Gabriel --caps true
