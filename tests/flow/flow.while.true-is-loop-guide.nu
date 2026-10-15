# id: flow.while.true-is-loop-guide
# rule: flow.while.statement
# expect: output
# ---
# 1
# 3
# 4
# ---
mut i = 0
while true {
  $i += 1
  if $i == 2 { continue }
  if $i > 4 { break }
  print $i
}
