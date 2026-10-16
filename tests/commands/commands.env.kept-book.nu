# id: commands.env.kept-book
# rule: commands.env.def-env
# expect: output
# ---
# After
# ---
def --env foo [] {
    $env.FOO = 'After'
}

$env.FOO = "Before"
foo
$env.FOO
