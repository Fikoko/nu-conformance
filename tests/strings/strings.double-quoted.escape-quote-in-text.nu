# id: strings.double-quoted.escape-quote-in-text
# rule: strings.double-quoted.escapes.literal
# expect: output
# ---
# "a\"b"
# ---
"a\"b" | to nuon
