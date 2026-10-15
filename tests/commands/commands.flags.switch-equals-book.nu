# id: commands.flags.switch-equals-book
# rule: commands.flags.switch
# expect: output
# ---
# ["Hello, Giulia!", "HELLO, HIROSHI!"]
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
[(greet Giulia --caps=false) (greet Hiroshi --caps=true)] | to nuon
