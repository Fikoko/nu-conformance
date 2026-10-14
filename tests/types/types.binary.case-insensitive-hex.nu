# id: types.binary.case-insensitive-hex
# rule: types.binary.literal
# expect: output
# ---
# true
# ---
0x[ff d8] == 0x[FFD8]
