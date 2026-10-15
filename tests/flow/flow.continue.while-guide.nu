# id: flow.continue.while-guide
# rule: flow.continue.skips
# expect: output
# ---
# 1
# 2
# 4
# 5
# 7
# ---
mut x = 0
while $x < 7 {
  $x += 1
  if $x mod 3 == 0 { continue }
  print $x
}
