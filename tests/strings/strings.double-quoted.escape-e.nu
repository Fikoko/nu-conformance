# id: strings.double-quoted.escape-e
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[1B]
# ---
"\e" | into binary | to nuon
