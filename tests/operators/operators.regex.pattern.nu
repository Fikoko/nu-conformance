# id: operators.regex.pattern
# rule: operators.regex.match
# expect: output
# ---
# [true, false, true]
# ---
[("nushell" =~ "^nu") ("nushell" =~ "^sh") ("abc" =~ "a.c")] | to nuon
