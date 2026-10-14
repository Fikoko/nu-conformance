# id: operators.spread.flags-unknown
# rule: operators.spread.flags
# expect: runtime-error
# error: nu::shell::error
def foo [ --flag req opt? ...args ] { { flag: $flag, req: $req, opt: $opt, args: $args } | to nuon }
foo ...{ nope: true } "bar"
