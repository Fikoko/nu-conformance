# id: commands.flags.spread-book
# rule: commands.flags.spread
# expect: output
# ---
# ["HELLO, KAI! YOU ARE 30.", "Hello, Kai! You are 18."]
# ---
def greet [
  name: string
  --age: int = 18
  --caps
] {
  let greeting = $"Hello, ($name)! You are ($age)."
  if $caps { $greeting | str uppercase } else { $greeting }
}
let options = { age: 30, caps: true }
[(greet Kai ...$options) (greet Kai ...{ age: null, caps: false })] | to nuon
