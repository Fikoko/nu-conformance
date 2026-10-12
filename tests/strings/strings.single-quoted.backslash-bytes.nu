# id: strings.single-quoted.backslash-bytes
# rule: strings.single-quoted.no-escapes
# expect: output
# ---
# 0x[615C5C62]
# ---
'a\\b' | into binary | to nuon
