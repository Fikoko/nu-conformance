# id: commands.def.for-returns-null-book
# rule: commands.def.result
# expect: output
# ---
# nothing
# ---
def exponents-of-three [] {
  for x in [ 0 1 2 3 4 5 ] {
    3 ** $x
  }
}
exponents-of-three | describe
