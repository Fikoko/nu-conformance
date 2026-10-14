# id: operators.spread.record-of-int
# rule: operators.spread.record
# expect: runtime-error
# error: nu::shell::cannot_spread_as_record
{...(1)}
