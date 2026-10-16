# id: pipelines.types.sleep-no-input-book
# rule: pipelines.types
# expect: parse-error
# error: nu::parser::missing_positional
echo 1sec | sleep
