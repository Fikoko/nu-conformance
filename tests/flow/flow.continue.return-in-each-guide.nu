# id: flow.continue.return-in-each-guide
# rule: flow.continue.each-return
# expect: output
# ---
# [10, 30]
# ---
[1 2 3] | each {|x| if $x == 2 { return }; $x * 10 } | to nuon
