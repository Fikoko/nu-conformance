# id: types.filesize.power-of-two-book
# rule: types.filesize.arithmetic
# expect: output
# ---
# true
# ---
(1GiB / 1B) == 2 ** 30
