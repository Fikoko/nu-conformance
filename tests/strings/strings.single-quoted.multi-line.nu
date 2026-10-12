# id: strings.single-quoted.multi-line
# rule: strings.single-quoted.syntax
# expect: output
# ---
# 0x[5468650A656E64]
# ---
'The
end' | into binary | to nuon
