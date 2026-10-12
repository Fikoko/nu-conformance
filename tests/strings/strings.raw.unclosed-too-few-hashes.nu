# id: strings.raw.unclosed-too-few-hashes
# rule: strings.raw.unclosed
# expect: parse-error
# error: nu::parser::unexpected_eof
r##'abc'#
