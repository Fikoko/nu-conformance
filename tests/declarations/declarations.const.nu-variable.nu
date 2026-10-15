# id: declarations.const.nu-variable
# rule: declarations.const.parse-time
# expect: output
# ---
# string
# ---
const x = $nu.os-info.name | describe
$x
