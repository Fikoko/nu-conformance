# id: aliases.expansion.external
# rule: aliases.expansion.external
# expect: output
# ---
# hi
# ---
alias q = ^$nu.current-exe --no-config-file -c 'print hi'
q
