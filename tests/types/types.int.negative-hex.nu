# id: types.int.negative-hex
# rule: types.int.radix-sign
# expect: output
# ---
# ["-0x10", "-0b11", "-0o7"]
# ---
[-0x10 -0b11 -0o7] | to nuon
