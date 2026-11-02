# id: aliases.help.flag
# rule: aliases.help
# expect: output
# ---
# Returns its arguments, ignoring the piped-in value.
# ---
alias q = echo a
q --help | lines | first
