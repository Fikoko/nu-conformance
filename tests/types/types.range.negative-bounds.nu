# id: types.range.negative-bounds
# rule: types.range.step
# expect: output
# ---
# [-3, -2, -1]
# ---
-3..-1 | each {||} | to nuon
