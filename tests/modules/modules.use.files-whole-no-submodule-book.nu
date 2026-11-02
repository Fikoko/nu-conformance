# id: modules.use.files-whole-no-submodule-book
# rule: modules.use.whole
# expect: runtime-error
# error: nu::shell::external_command
use greetings.nu
greetings formal hello
