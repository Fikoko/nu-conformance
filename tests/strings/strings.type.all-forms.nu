# id: strings.type.all-forms
# rule: strings.type
# expect: output
# ---
# [string, string, string, string, string, string]
# ---
[('a' | describe), ("a" | describe), (r#'a'# | describe), ($"a" | describe), (echo `a` | describe), (echo a | describe)] | to nuon
