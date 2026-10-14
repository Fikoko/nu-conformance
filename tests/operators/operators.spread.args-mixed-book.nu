# id: operators.spread.args-mixed-book
# rule: operators.spread.args
# expect: output
# ---
# {flag: false, req: bar, opt: baz, args: [1, 2, 3, 4, 5, 6, 7, last]}
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo "bar" "baz" 1 ...[2 3] 4 5 ...(6..9 | take 2) last
