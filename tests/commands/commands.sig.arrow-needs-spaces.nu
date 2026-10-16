# id: commands.sig.arrow-needs-spaces
# rule: commands.sig.declare
# expect: parse-error
# error: nu::parser::unknown_type
def f []: int->int { $in }
