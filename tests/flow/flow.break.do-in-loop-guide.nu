# id: flow.break.do-in-loop-guide
# rule: flow.break.placement
# expect: compile-error
# error: nu::compile::not_in_a_loop
for x in 1..3 { do { break } }
