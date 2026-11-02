# id: aliases.expansion.overlay-new
# rule: aliases.expansion.keywords
# expect: output
# ---
# scratch
# ---
alias on = overlay new
on scratch
overlay list | last | get name
