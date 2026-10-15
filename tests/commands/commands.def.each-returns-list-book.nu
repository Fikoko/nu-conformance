# id: commands.def.each-returns-list-book
# rule: commands.def.result
# expect: output
# ---
# [1, 3, 9, 27, 81, 243]
# ---
def exponents-of-three [] {
  [ 0 1 2 3 4 5 ] | each {|x|
    3 ** $x
  }
}

exponents-of-three | to nuon
