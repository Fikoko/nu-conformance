# id: strings.interp.escaped-parens-book
# rule: strings.interp.escaped-paren
# expect: output
# ---
# "2 + 2 is 4 (you guessed it!)"
# ---
$"2 + 2 is (2 + 2) \(you guessed it!)" | to nuon
