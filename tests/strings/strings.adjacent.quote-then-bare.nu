# id: strings.adjacent.quote-then-bare
# rule: strings.adjacent.other
# expect: parse-error
# error: nu::parser::extra_token_after_closing_delimiter
'a'b
