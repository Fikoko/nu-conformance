# id: commands.attr.deprecated-warns-book
# rule: commands.attr.deprecated
# expect: output
# ---
# [true, true]
# ---
let r = (^$nu.current-exe --no-config-file -c "@deprecated 'Use vip-greet as a replacement.'\ndef greet [name] { 1 }\ngreet bob" | complete)
[($r.stderr | str contains 'nu::parser::deprecated') ($r.stderr | str contains 'Use vip-greet as a replacement.')] | to nuon
