# id: commands.flags.spread-unknown-book
# rule: commands.flags.spread
# expect: runtime-error
# error: nu::shell::error
def greet [
  name: string
  --age: int = 18
  --caps
] {
  let greeting = $"Hello, ($name)! You are ($age)."
  if $caps { $greeting | str uppercase } else { $greeting }
}
greet Kai ...{ colour: red }
