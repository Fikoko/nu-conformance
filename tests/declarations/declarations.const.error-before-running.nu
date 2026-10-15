# id: declarations.const.error-before-running
# rule: declarations.const.parse-time
# expect: output
# ---
# parse error
# ---
let r = (^$nu.current-exe --no-config-file -c 'print hi; const x = (ls | length)' | complete)
if $r.exit_code != 0 and $r.stdout == '' { 'parse error' } else { $r.stdout }
