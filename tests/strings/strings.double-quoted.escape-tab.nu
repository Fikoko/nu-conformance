# id: strings.double-quoted.escape-tab
# rule: strings.double-quoted.escapes
# expect: output
# ---
# 3
# ---
"a\tb" | str length | to nuon
