# id: operators.spread.args-flag-after-book
# rule: operators.spread.args
# expect: output
# ---
# {flag: true, req: bar, opt: baz, args: [1, 2, 3, 4]}
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo "bar" "baz" 1 ...[2 3] --flag 4
