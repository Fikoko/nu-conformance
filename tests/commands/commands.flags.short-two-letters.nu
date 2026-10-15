# id: commands.flags.short-two-letters
# rule: commands.flags.short
# expect: parse-error
# error: nu::parser::parse_mismatch
def f [--long (-ab)] { 1 }
