# id: types.list.index-past-end
# rule: types.list.index
# expect: runtime-error
# error: nu::shell::access_beyond_end
let l = [a b c]
$l.3
