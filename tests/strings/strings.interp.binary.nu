# id: strings.interp.binary
# rule: strings.interp.structured
# expect: output
# ---
# "[1, 255]"
# ---
$"(0x[01 ff])" | to nuon
