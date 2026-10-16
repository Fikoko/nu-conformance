# id: pipelines.redirect.internal-stderr-guide
# rule: pipelines.redirect.internal
# expect: runtime-error
# error: nu::shell::error
ls e>| str length
