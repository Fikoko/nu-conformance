# id: flow.try.error-record-guide
# rule: flow.try.error-record
# expect: output
# ---
# ["Division by zero.", "nu::shell::division_by_zero"]
# ---
try { 1 / 0 } catch {|err| [$err.msg $err.details.code] } | to nuon
