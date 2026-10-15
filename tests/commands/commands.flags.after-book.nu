# id: commands.flags.after-book
# rule: commands.flags.value
# expect: output
# ---
# {name: Lucia, age: 23}
# ---
def greet [
  name: string
  --age: int
] {
    {
      name: $name
      age: $age
    }
}
greet Lucia --age 23 | to nuon
