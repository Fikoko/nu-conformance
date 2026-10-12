# id: strings.double-quoted.hex-lowercase
# rule: strings.double-quoted.escapes.hex
# expect: output
# ---
# 0x[7F]
# ---
"\x7f" | into binary | to nuon
