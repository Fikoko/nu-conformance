# id: commands.params.guide-example
# rule: commands.params.kinds
# expect: output
# ---
# ["Hello, Ada!", "HI, ADA!", "Hello, Ada! Hello, Ada!"]
# ---
def greet [
  name: string          # required positional
  greeting?: string     # optional positional
  --shout (-s)          # switch
  --times: int = 1      # flag with a value and a default
] {
  let text = $"($greeting | default 'Hello'), ($name)!"
  let text = if $shout { $text | str uppercase } else { $text }
  1..$times | each { $text } | str join ' '
}
[(greet Ada) (greet Ada Hi --shout) (greet Ada --times 2)] | to nuon
