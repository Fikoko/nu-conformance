# id: types.filesize.underscores-and-exponent
# rule: types.filesize.literal
# expect: output
# ---
# [1000b, 1000b]
# ---
[1_000B 1e3B] | to nuon
