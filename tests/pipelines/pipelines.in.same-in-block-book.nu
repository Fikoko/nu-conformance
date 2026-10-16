# id: pipelines.in.same-in-block-book
# rule: pipelines.in.block
# expect: output
# ---
# a
# a
# b
# b
# c
# c
# [a, b, c]
# ---
[ a b c ] | each {
  print $in
  print $in
  $in
} | to nuon
