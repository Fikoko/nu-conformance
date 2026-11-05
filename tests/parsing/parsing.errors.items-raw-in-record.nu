# id: parsing.errors.items-raw-in-record
# rule: parsing.errors.items
# expect: parse-error
# error: nu::parser::parse_mismatch
{a: r#a} | to nuon
