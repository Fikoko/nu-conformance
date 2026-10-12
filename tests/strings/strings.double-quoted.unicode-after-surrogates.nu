# id: strings.double-quoted.unicode-after-surrogates
# rule: strings.double-quoted.escapes.unicode
# expect: output
# ---
# 0x[EE8080]
# ---
"\u{E000}" | into binary | to nuon
