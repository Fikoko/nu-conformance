# id: strings.double-quoted.escape-punctuation
# rule: strings.double-quoted.escapes.literal
# expect: output
# ---
# 0x[22275C2F28297B7D245E237C7E]
# ---
"\"\'\\\/\(\)\{\}\$\^\#\|\~" | into binary | to nuon
