# id: operators.spread.args-space
# rule: operators.spread.args
# expect: output
# ---
# {flag: false, req: bar, opt: baz, args: ["...", [1]]}
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo bar baz ... [1]
