# id: strings.double-quoted.escape-r
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[0D]
# ---
"\r" | into binary | to nuon
