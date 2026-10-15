# id: commands.flags.switch-book
# rule: commands.flags.switch
# expect: output
# ---
# ["HELLO, MIGUEL!", "Hello, Chukwuemeka!"]
# ---
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
[(greet Miguel --caps) (greet Chukwuemeka)] | to nuon
