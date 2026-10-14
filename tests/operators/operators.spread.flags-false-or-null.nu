# id: operators.spread.flags-false-or-null
# rule: operators.spread.flags
# expect: output
# ---
# [[flag, req, opt, args]; [false, bar, null, []], [false, bar, null, []]]
# ---
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } }
[(foo ...{ flag: false } "bar") (foo ...{ flag: null } "bar")] | to nuon
