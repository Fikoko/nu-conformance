# id: modules.use.whole-no-submodule
# rule: modules.use.whole
# expect: runtime-error
# error: nu::shell::external_command
module nu-conformance-m { export module sub { export def f [] { 'sub' } } }
use nu-conformance-m
nu-conformance-m sub f
