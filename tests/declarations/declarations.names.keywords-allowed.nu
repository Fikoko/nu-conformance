# id: declarations.names.keywords-allowed
# rule: declarations.names.reserved
# expect: output
# ---
# [1, 2, 3]
# ---
let it = 1
let true = 2
let null = 3
[$it $true $null] | to nuon
