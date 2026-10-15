# id: commands.flags.short-book
# rule: commands.flags.short
# expect: output
# ---
# {name: Akosua, age: 35}
# ---
def greet [
  name: string
  --age (-a): int
] {
    {
      name: $name
      age: $age
    }
  }
greet Akosua -a 35 | to nuon
