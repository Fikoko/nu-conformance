# id: commands.flags.equals
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
greet Ali --age=39 | to nuon
