# id: operators.spread.args-forward-book
# rule: operators.spread.args
# expect: output
# ---
# {flag: true, req: bar, opt: baz, args: [1, 2, 3]}
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
def bar [ ...args ] { foo --flag "bar" "baz" ...$args }
bar 1 2 3
