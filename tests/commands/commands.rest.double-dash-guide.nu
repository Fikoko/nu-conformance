# id: commands.rest.double-dash-guide
# rule: commands.rest.end-of-flags
# expect: output
# ---
# {flag: false, args: [--flag, x]}
# ---
def show [--flag, ...args] { {flag: $flag, args: $args} }
show -- --flag x | to nuon
