# id: commands.flags.dash-to-underscore-book
# rule: commands.flags.names
# expect: output
# ---
# HELLO, ANA!
# ---
def greet [
  name: string
  --all-caps
] {
    let greeting = $"Hello, ($name)!"
    if $all_caps {
      $greeting | str uppercase
    } else {
      $greeting
    }
}
greet Ana --all-caps
