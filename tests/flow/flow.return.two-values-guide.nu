# id: flow.return.two-values-guide
# rule: flow.return.early
# expect: parse-error
# error: nu::parser::extra_positional
def f [] { return 1 2 }
