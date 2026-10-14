# id: operators.spread.flags-wrong-type
# rule: operators.spread.flags
# expect: runtime-error
# error: nu::shell::cant_convert
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo ...{ flag: 5 } "bar"
