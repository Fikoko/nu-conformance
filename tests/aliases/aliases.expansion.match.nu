# id: aliases.expansion.match
# rule: aliases.expansion.keywords
# expect: output
# ---
# two
# ---
alias m = match
m 2 { 2 => 'two', _ => 'other' }
