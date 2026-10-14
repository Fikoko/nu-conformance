# id: operators.regex.raw-string-pattern
# rule: operators.regex.match
# expect: output
# ---
# true
# ---
"ab" =~ r#'\w+'#
