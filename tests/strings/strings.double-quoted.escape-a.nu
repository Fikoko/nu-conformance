# id: strings.double-quoted.escape-a
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[07]
# ---
"\a" | into binary | to nuon
