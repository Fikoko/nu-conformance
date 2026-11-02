# id: modules.define.main-only
# rule: modules.define.main
# expect: output
# ---
# main
# ---
module m { export def main [] { 'main' } }
use m
m
