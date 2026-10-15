# id: flow.try.two-catches
# rule: flow.try.syntax
# expect: compile-error
# error: nu::compile::invalid_keyword_call
try { 1 / 0 } catch { 'c' } catch { 'd' }
