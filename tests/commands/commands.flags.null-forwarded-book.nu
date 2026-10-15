# id: commands.flags.null-forwarded-book
# rule: commands.flags.null
# expect: output
# ---
# ["Hello, Kai! You are 18.", "Hello, Kai! You are 30."]
# ---
def greet [
  name: string
  --age: int = 18
  --caps
] {
  let greeting = $"Hello, ($name)! You are ($age)."
  if $caps { $greeting | str uppercase } else { $greeting }
}
def party [name: string, --age: int] {
  greet $name --age=$age
}
[(party Kai) (party Kai --age 30)] | to nuon
