# id: flow.return.closure-in-each-guide
# rule: flow.return.scope
# expect: output
# ---
# [1, two, 3]
# ---
def labels [] {
  [1 2 3] | each {|x| if $x == 2 { return "two" }; $x }
}
labels | to nuon
