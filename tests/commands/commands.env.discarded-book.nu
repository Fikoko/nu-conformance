# id: commands.env.discarded-book
# rule: commands.env.def-env
# expect: output
# ---
# Before
# ---
def foo [] {
    $env.FOO = 'After'
}

$env.FOO = "Before"
foo
$env.FOO
