# id: pipelines.in.subexpression-book
# rule: pipelines.in.block
# expect: output
# ---
# 4
# 4
# 8.0
# ---
4 | do {
  print $in

  let p = (
    $in * $in
    | $in / 2
  )

  print $in
  print $p
}
