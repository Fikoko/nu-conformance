# id: commands.flags.spread-guide
# rule: commands.flags.spread
# expect: output
# ---
# {color: red, count: 1, verbose: true}
# ---
def f [--color: string, --count: int = 1, --verbose] { {color: $color, count: $count, verbose: $verbose} }
let opts = {color: red, count: null, verbose: true}
f ...$opts | to nuon
