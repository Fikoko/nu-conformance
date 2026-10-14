# id: operators.assign.list-past-end
# rule: operators.assign.cell-path
# expect: runtime-error
# error: nu::shell::access_beyond_end
mut l = [1 2]
$l.5 = 9
