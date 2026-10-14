# id: operators.spread.args-no-rest
# rule: operators.spread.args
# expect: parse-error
# error: nu::parser::unexpected_spread_arg
def two [a b] { [$a $b] | to nuon }
two ...[1 2]
