# id: flow.return.guide
# rule: flow.return.early
# expect: output
# ---
# [negative, zero, positive]
# ---
def sign [n: int] {
  if $n < 0 { return "negative" }
  if $n == 0 { return "zero" }
  "positive"
}
[(sign -5) (sign 0) (sign 7)] | to nuon
