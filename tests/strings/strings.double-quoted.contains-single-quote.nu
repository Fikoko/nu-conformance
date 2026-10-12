# id: strings.double-quoted.contains-single-quote
# rule: strings.double-quoted.syntax
# expect: output
# ---
# "This is just a string 'that needs an inner part quoted'"
# ---
"This is just a string 'that needs an inner part quoted'" | to nuon
