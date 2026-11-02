# id: modules.define.main-book
# rule: modules.define.main
# expect: output
# ---
# ["Hello!", "HELLO!"]
# ---
module greet {
    export def main [] { "Hello!" }
    export def loud [] { "HELLO!" }
}
use greet
[(greet) (greet loud)] | to nuon
