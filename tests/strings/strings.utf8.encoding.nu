# id: strings.utf8.encoding
# rule: strings.utf8
# expect: output
# ---
# 0x[C3A9]
# ---
"é" | into binary | to nuon
