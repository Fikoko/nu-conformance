# id: flow.try.finally-before-catch
# rule: flow.try.syntax
# expect: compile-error
# error: nu::compile::invalid_keyword_call
try { 1 } finally { 2 } catch { 3 }
