# id: commands.rest.double-dash-book
# rule: commands.rest.end-of-flags
# expect: output
# ---
# [--verbose, -x, foo]
# ---
def show-args [...args] { $args }

show-args -- --verbose -x foo | to nuon
