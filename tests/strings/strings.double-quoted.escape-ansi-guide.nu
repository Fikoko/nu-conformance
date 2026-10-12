# id: strings.double-quoted.escape-ansi-guide
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[1B5B33316D48656C6C6F]
# ---
"\e[31mHello" | into binary | to nuon
