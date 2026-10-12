# id: strings.double-quoted.unicode-emoji
# rule: strings.double-quoted.escapes.unicode
# expect: output
# ---
# 0x[F09F9880]
# ---
"\u{1F600}" | into binary | to nuon
