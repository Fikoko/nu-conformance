# id: strings.single-quoted.backslash-literal
# rule: strings.single-quoted.no-escapes
# expect: output
# ---
# "a\\nb"
# ---
'a\nb' | to nuon
