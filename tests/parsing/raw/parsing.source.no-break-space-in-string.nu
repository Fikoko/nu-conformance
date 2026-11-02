# id: parsing.source.no-break-space-in-string
# rule: parsing.source.whitespace
# expect: output
# ---
# 0x[61C2A062]
# ---
"a b" | into binary | to nuon
