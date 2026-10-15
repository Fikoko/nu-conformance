# id: flow.continue.where-guide
# rule: flow.continue.each-return
# expect: output
# ---
# [10, 30]
# ---
[1 2 3] | where $it != 2 | each {|x| $x * 10 } | to nuon
