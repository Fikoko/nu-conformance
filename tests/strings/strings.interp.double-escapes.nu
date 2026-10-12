# id: strings.interp.double-escapes
# rule: strings.interp.double-escapes
# expect: output
# ---
# 0x[610A62]
# ---
$"a\nb" | into binary | to nuon
