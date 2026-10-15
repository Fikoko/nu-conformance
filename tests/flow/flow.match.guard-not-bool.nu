# id: flow.match.guard-not-bool
# rule: flow.match.guards
# expect: runtime-error
# error: nu::shell::match_guard_not_bool
match 5 { $x if 1 => 'y', _ => 'n' }
