# id: strings.single-quoted.contains-hash
# rule: strings.single-quoted.syntax
# expect: output
# ---
# "a#b"
# ---
'a#b' | to nuon
