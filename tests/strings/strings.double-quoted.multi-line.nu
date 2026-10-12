# id: strings.double-quoted.multi-line
# rule: strings.double-quoted.syntax
# expect: output
# ---
# 0x[610A62]
# ---
"a
b" | into binary | to nuon
