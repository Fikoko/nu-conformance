# id: modules.hide.main-book
# rule: modules.hide.command
# expect: output
# ---
# HELLO!
# ---
module greet {
    export def main [] { "Hello!" }
    export def loud [] { "HELLO!" }
}
use greet
hide greet main
greet loud
