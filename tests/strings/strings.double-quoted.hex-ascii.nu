# id: strings.double-quoted.hex-ascii
# rule: strings.double-quoted.escapes.hex
# expect: output
# ---
# 0x[41]
# ---
"\x41" | into binary | to nuon
