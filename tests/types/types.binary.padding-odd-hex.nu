# id: types.binary.padding-odd-hex
# rule: types.binary.padding
# expect: output
# ---
# [0x[0F], 0x[0123]]
# ---
[0x[f] 0x[123]] | to nuon
