# id: commands.def.input-book
# rule: commands.def.input
# expect: output
# ---
# [2, 4, 6]
# ---
def double [] {
  each { |num| 2 * $num }
}
[1 2 3] | double | to nuon
