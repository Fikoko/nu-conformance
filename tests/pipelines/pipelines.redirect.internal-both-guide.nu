# id: pipelines.redirect.internal-both-guide
# rule: pipelines.redirect.internal
# expect: runtime-error
# error: nu::shell::error
ls o+e>| str length
