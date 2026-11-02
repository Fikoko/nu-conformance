# id: aliases.intro.ll-book
# rule: aliases.intro
# expect: output
# ---
# true
# ---
alias ll = ls -l
(ll | columns) == (ls -l | columns)
