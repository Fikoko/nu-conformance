# id: operators.bit.and-or-xor
# rule: operators.bit.logic
# expect: output
# ---
# [2, 7, 5]
# ---
[(6 bit-and 3) (6 bit-or 3) (6 bit-xor 3)] | to nuon
