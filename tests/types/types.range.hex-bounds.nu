# id: types.range.hex-bounds
# rule: types.range.literal
# expect: output
# ---
# [1, 2, 3]
# ---
0x1..0x3 | each {||} | to nuon
