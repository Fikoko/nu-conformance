# id: parsing.source.crlf-in-string
# rule: parsing.source.line-endings
# expect: output
# ---
# 0x[610D0A62]
# ---
"a
b" | into binary | to nuon
