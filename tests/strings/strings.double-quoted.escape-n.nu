# id: strings.double-quoted.escape-n
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[0A]
# ---
"\n" | into binary | to nuon
