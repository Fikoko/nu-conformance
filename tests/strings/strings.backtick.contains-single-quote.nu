# id: strings.backtick.contains-single-quote
# rule: strings.backtick.syntax
# expect: output
# ---
# "it's"
# ---
echo `it's` | to nuon
