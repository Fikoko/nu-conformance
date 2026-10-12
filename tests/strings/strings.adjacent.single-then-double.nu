# id: strings.adjacent.single-then-double
# rule: strings.adjacent.other
# expect: parse-error
# error: nu::parser::extra_token_after_closing_delimiter
'a'"b"
