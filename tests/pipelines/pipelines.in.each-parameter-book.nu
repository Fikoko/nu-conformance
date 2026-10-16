# id: pipelines.in.each-parameter-book
# rule: pipelines.in.block
# expect: output
# ---
# [2, 4, 6]
# ---
1..3 | each {|value| $value * 2} | to nuon
