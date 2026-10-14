# id: operators.bit.shift-right-keeps-sign
# rule: operators.bit.shift
# expect: output
# ---
# [-1, -4]
# ---
[(-1 bit-shr 1) (-16 bit-shr 2)] | to nuon
