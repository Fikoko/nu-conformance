# id: flow.break.in-if
# rule: flow.break.placement
# expect: compile-error
# error: nu::compile::not_in_a_loop
if true { break }
