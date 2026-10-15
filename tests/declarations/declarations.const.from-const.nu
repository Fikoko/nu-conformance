# id: declarations.const.from-const
# rule: declarations.const.parse-time
# expect: output
# ---
# 2
# ---
const x = 1
const y = $x * 2
$y
