# id: operators.spread.args-skips-optional-book
# rule: operators.spread.args
# expect: output
# ---
# {flag: false, req: bar, opt: null, args: [1, 2, "not opt"]}
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo "bar" ...[1 2] "not opt"
