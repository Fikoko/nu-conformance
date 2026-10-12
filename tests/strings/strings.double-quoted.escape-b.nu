# id: strings.double-quoted.escape-b
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[08]
# ---
"\b" | into binary | to nuon
