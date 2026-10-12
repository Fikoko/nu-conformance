# id: strings.double-quoted.escape-space
# rule: strings.double-quoted.escapes.space
# expect: output
# ---
# 0x[612062]
# ---
"a\ b" | into binary | to nuon
