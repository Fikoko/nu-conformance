# id: commands.sig.input-checked-at-runtime
# rule: commands.sig.input
# expect: runtime-error
# error: nu::shell::only_supports_this_input_type
def f []: int -> int { $in }
let x: any = "a"
$x | f
