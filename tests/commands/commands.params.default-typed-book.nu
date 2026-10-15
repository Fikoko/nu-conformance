# id: commands.params.default-typed-book
# rule: commands.params.default
# expect: output
# ---
# Happy birthday! You are 18 years old now!
# ---
def congratulate [age: int = 18] {
  $"Happy birthday! You are ($age) years old now!"
}
congratulate
