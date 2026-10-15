# id: commands.def.input-streams-book
# rule: commands.def.input
# expect: output
# ---
# [2, 4, 6]
# ---
def double [] {
  each { |num| 2 * $num }
}
1.. | each {||} | double | first 3 | to nuon
