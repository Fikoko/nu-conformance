# id: flow.for.no-flags
# rule: flow.for.statement
# expect: parse-error
# error: nu::parser::unknown_flag
for x in [1 2] --numbered { print $x }
