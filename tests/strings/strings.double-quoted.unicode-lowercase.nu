# id: strings.double-quoted.unicode-lowercase
# rule: strings.double-quoted.escapes.unicode
# expect: output
# ---
# 0x[C3A9]
# ---
"\u{e9}" | into binary | to nuon
