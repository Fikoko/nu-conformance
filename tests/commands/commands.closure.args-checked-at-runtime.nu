# id: commands.closure.args-checked-at-runtime
# rule: commands.closure.checking
# expect: runtime-error
# error: nu::shell::cant_convert
let f = {|x: int| $x }
do $f a
