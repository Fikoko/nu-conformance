# id: flow.try.exit-not-caught
# rule: flow.try.exit
# expect: output
# ---
# 3
# ---
(^$nu.current-exe --no-config-file -c "try { exit 3 } catch { 'caught' }" | complete).exit_code
