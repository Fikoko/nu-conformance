# id: types.binary.padding-bits
# rule: types.binary.padding
# expect: output
# ---
# [0x[01], 0x[01FF], 0x[0100]]
# ---
[0b[1] 0b[11111111 1] 0b[100000000]] | to nuon
