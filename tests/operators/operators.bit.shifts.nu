# id: operators.bit.shifts
# rule: operators.bit.shift
# expect: output
# ---
# [16, 16]
# ---
[(1 bit-shl 4) (256 bit-shr 4)] | to nuon
