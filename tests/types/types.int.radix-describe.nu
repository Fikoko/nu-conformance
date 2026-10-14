# id: types.int.radix-describe
# rule: types.int.radix
# expect: output
# ---
# [int, int, int]
# ---
[(0xff | describe), (0o7 | describe), (0b1 | describe)] | to nuon
