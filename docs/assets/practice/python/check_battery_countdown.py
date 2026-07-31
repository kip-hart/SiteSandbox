# check_battery_countdown.py
#
# Practice problem checker for ENAE202 - While Loops.
# Save this file in the same folder as your battery_countdown.py script,
# then run "python check_battery_countdown.py" from a terminal.

import os
import runpy

SCRIPT = "battery_countdown.py"

if not os.path.isfile(SCRIPT):
    raise FileNotFoundError(
        f"Could not find {SCRIPT} in the current folder. Save your script there, "
        "and run this checker from the same folder."
    )

ns = runpy.run_path(SCRIPT)

print("\n--- Checking your answers ---")
all_correct = True
tol = 1e-3


def check_number(name, expected):
    global all_correct
    if name not in ns:
        print(f'[MISSING] {name} is not defined. Did you name your variable exactly "{name}"?')
        all_correct = False
        return
    val = ns[name]
    if abs(val - expected) / abs(expected) < tol:
        print(f"[PASS] {name} = {val}")
    else:
        print(f"[FAIL] {name} = {val} (that doesn't look right - check your loop condition)")
        all_correct = False


check_number("hours_until_critical", 11)
check_number("charge_pct", 15)

if all_correct:
    print("\nAll checks passed! Nice work.")
else:
    print("\nSome checks did not pass yet. Review the flagged variables above and try again.")
