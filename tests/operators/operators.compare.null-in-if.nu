# id: operators.compare.null-in-if
# rule: operators.compare.null
# expect: runtime-error
# error: nu::shell::cant_convert
if (null < 1) { "y" } else { "n" }
