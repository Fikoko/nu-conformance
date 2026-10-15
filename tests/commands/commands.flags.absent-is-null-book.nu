# id: commands.flags.absent-is-null-book
# rule: commands.flags.value
# expect: output
# ---
# {name: World, age: null}
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
greet World | to nuon
