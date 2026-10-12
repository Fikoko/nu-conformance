# id: strings.type.forms-equal
# rule: strings.type
# expect: output
# ---
# true
# ---
'a' == "a" and "a" == r#'a'# and r#'a'# == $"a" and $"a" == (echo `a`)
