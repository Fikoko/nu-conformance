# id: commands.wrapped.block-argument
# rule: commands.wrapped.rest
# expect: parse-error
# error: nu::parser::parse_mismatch_with_full_string_msg
def --wrapped f [...rest] { $rest }
f { 1 }
