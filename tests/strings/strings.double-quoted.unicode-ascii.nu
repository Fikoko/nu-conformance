# id: strings.double-quoted.unicode-ascii
# rule: strings.double-quoted.escapes.unicode
# expect: output
# ---
# 0x[41]
# ---
"\u{41}" | into binary | to nuon
