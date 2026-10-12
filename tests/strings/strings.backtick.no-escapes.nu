# id: strings.backtick.no-escapes
# rule: strings.backtick.syntax
# expect: output
# ---
# 0x[615C6E62]
# ---
echo `a\nb` | into binary | to nuon
