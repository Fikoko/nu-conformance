# id: flow.break.in-def
# rule: flow.break.placement
# expect: compile-error
# error: nu::compile::not_in_a_loop
def f [] { break }
