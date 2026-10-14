# id: operators.spread.flags-book
# rule: operators.spread.flags
# expect: output
# ---
# {flag: true, req: bar, opt: null, args: []}
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo ...{ flag: true } "bar"
