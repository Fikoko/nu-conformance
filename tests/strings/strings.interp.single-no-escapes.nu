# id: strings.interp.single-no-escapes
# rule: strings.interp.single-no-escapes
# expect: output
# ---
# 0x[615C6E62]
# ---
$'a\nb' | into binary | to nuon
