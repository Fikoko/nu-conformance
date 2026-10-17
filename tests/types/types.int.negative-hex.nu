# id: types.int.negative-hex
# rule: types.int.radix-sign
# expect: output
# ---
# [-16, -3, -7]
# ---
# status: pending
[-0x10 -0b11 -0o7] | to nuon
