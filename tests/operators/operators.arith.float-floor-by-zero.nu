# id: operators.arith.float-floor-by-zero
# rule: operators.arith.division-by-zero
# expect: runtime-error
# error: nu::shell::division_by_zero
7.0 // 0
