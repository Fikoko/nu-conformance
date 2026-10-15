# id: commands.flags.before-book
# rule: commands.flags.value
# expect: output
# ---
# {name: Ali, age: 39}
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
greet --age 39 Ali | to nuon
