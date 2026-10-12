# id: strings.double-quoted.escape-t
# rule: strings.double-quoted.escapes.control
# expect: output
# ---
# 0x[09]
# ---
"\t" | into binary | to nuon
