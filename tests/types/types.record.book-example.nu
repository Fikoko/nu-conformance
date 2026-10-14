# id: types.record.book-example
# rule: types.record.literal
# expect: output
# ---
# Kylian
# ---
let my_record = {
  name: "Kylian"
  rank: 99
}
$my_record | get name
