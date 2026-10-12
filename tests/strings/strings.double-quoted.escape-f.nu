# id: strings.double-quoted.escape-f
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[0C]
# ---
"\f" | into binary | to nuon
