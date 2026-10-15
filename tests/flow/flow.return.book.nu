# id: flow.return.book
# rule: flow.return.early
# expect: output
# ---
# [positive, non-positive]
# ---
def 'positive-check' [it] {
    if $it > 0 {
        return 'positive'
    };

    'non-positive'
}
[(positive-check 3) (positive-check (-3))] | to nuon
