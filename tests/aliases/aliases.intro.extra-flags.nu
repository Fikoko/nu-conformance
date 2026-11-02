# id: aliases.intro.extra-flags
# rule: aliases.intro
# expect: output
# ---
# true
# ---
alias ll = ls -l
(ll -a | columns) == (ls -l -a | columns)
