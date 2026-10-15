# id: flow.return.leaves-loop-guide
# rule: flow.return.scope
# expect: output
# ---
# 4
# ---
def first-even [nums: list<int>] {
  for n in $nums {
    if $n mod 2 == 0 { return $n }
  }
  null
}
first-even [1 3 4 5 6]
