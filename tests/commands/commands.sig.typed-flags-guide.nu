# id: commands.sig.typed-flags-guide
# rule: commands.sig.flags
# expect: output
# ---
# [[count, verbose]; [null, false], [3, true]]
# ---
def f [--count: int, --verbose] { {count: $count, verbose: $verbose} }
[(f) (f --count 3 --verbose)] | to nuon
