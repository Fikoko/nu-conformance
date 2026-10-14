# id: types.int.negative-hex-describe
# rule: types.int.radix-sign
# expect: output
# ---
# string
# ---
let x = -0x10
$x | describe
