# id: operators.bit.shift-into-sign-bit
# rule: operators.bit.shift
# expect: output
# ---
# -9223372036854775808
# ---
1 bit-shl 63 | to nuon
