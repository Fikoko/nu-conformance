# id: pipelines.in.each-closure-book
# rule: pipelines.in.block
# expect: output
# ---
# [2, 4, 6]
# ---
1..3 | each {$in * 2} | to nuon
