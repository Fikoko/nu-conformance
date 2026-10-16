# id: pipelines.external.pipefail-later-succeeds
# rule: pipelines.external.failure
# expect: output
# ---
# 3
# ---
def --wrapped fail [...rest] { ^$nu.current-exe --no-config-file -c 'exit 3' ...$rest }
try { fail | lines | length } catch {|e| $e.exit_code }
