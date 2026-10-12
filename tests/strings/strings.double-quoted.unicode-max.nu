# id: strings.double-quoted.unicode-max
# rule: strings.double-quoted.escapes.unicode
# expect: output
# ---
# 0x[F48FBFBF]
# ---
"\u{10FFFF}" | into binary | to nuon
