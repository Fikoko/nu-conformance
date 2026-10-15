# id: flow.loop.guide
# rule: flow.loop.repeat
# expect: output
# ---
# 1
# 2
# 3
# ---
mut n = 1
loop {
  print $n
  if $n >= 3 { break }
  $n += 1
}
