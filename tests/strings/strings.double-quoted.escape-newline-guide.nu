# id: strings.double-quoted.escape-newline-guide
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[68656C6C6F0A776F726C64]
# ---
"hello\nworld" | into binary | to nuon
