---
name: verify
description: Use at the end of any task that modified code, configs, or outputs. Runs the verification checklist and summarizes pass/fail.
---

## Steps
1) Run: `bash scripts/verify.sh <CONFIG>`
2) If it fails, show the failure point and log paths.
3) If it passes, report:
   - git status
   - artifact paths created/updated
   - verification log path