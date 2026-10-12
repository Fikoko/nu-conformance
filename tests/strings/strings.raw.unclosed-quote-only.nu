# id: strings.raw.unclosed-quote-only
# rule: strings.raw.unclosed
# expect: parse-error
# error: nu::parser::unexpected_eof
r#'abc'
