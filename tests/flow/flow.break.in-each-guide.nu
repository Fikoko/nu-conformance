# id: flow.break.in-each-guide
# rule: flow.break.placement
# expect: compile-error
# error: nu::compile::not_in_a_loop
[1 2 3] | each {|x| if $x == 2 { break }; $x }
