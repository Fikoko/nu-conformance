# id: commands.wrapped.known-flags
# rule: commands.wrapped.rest
# expect: output
# ---
# {k: true, r: [--other]}
# ---
def --wrapped w [--known, ...rest] { {k: $known, r: $rest} }
w --known --other | to nuon
