# id: aliases.expansion.try
# rule: aliases.expansion.keywords
# expect: output
# ---
# caught
# ---
alias t = try
t { error make {msg: x} } catch { 'caught' }
