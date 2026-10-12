# id: strings.raw.no-escapes-guide
# rule: strings.raw.syntax
# expect: output
# ---
# "some\\nliteral\\tstring"
# ---
r#'some\nliteral\tstring'# | to nuon
