# id: types.filesize.just-over-max-error
# rule: types.filesize.range
# expect: parse-error
# error: nu::parser::literal_too_large
# status: pending
8EiB | to nuon
