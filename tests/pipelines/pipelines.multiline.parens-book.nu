# id: pipelines.multiline.parens-book
# rule: pipelines.multiline
# expect: output
# ---
# 2021
# ---
let year = (
    "01/22/2021" |
    parse "{month}/{day}/{year}" |
    get year
)
$year.0
