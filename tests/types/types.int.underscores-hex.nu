# id: types.int.underscores-hex
# rule: types.int.underscores
# expect: output
# ---
# [255, 255]
# ---
[0x_ff 0xf_f] | to nuon
