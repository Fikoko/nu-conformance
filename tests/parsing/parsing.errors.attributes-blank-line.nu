# id: parsing.errors.attributes-blank-line
# rule: parsing.errors.attributes
# expect: parse-error
# error: nu::parser::attribute_requires_definition
@category test

def bar [] { 'bar' }
bar
