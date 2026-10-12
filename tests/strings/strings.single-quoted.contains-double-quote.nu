# id: strings.single-quoted.contains-double-quote
# rule: strings.single-quoted.syntax
# expect: output
# ---
# "This is also a string \"that needs an inner part quoted\""
# ---
'This is also a string "that needs an inner part quoted"' | to nuon
