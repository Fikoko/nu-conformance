# id: strings.double-quoted.hex-multibyte
# rule: strings.double-quoted.escapes.hex
# expect: output
# ---
# 0x[C3A9]
# ---
"\xC3\xA9" | into binary | to nuon
