# id: modules.hide.module-book
# rule: modules.hide.command
# expect: runtime-error
# error: nu::shell::external_command
module nu-conformance-greet {
    export def main [] { "Hello!" }
    export def loud [] { "HELLO!" }
}
use nu-conformance-greet
hide nu-conformance-greet
nu-conformance-greet
