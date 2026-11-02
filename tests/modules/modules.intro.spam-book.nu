# id: modules.intro.spam-book
# rule: modules.intro
# expect: output
# ---
# [foo, bar]
# ---
module spam { export def foo [] { "foo" }; export def bar [] { "bar" } }
use spam
[(spam foo) (spam bar)] | to nuon
