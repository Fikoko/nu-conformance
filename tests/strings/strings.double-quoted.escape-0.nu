# id: strings.double-quoted.escape-0
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[00]
# ---
"\0" | into binary | to nuon
