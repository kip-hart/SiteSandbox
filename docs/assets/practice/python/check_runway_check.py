# check_runway_check.py
#
# Practice problem checker for ENAE202 - Conditionals.
# Save this file in the same folder as your runway_check.py script,
# then run "python check_runway_check.py" from a terminal.

import os
import runpy

SCRIPT = "runway_check.py"

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
        print(f"[FAIL] {name} = {val} (that doesn't look right - check your formula)")
        all_correct = False


def check_string(name, expected):
    global all_correct
    if name not in ns:
        print(f'[MISSING] {name} is not defined. Did you name your variable exactly "{name}"?')
        all_correct = False
        return
    val = ns[name]
    if val == expected:
        print(f"[PASS] {name} = {val!r}")
    else:
        print(f"[FAIL] {name} = {val!r} (that doesn't look right - check your if/elif thresholds)")
        all_correct = False


check_number("margin_ft", 900)
check_string("status", "Caution")

if all_correct:
    print("\nAll checks passed! Nice work.")
else:
    print("\nSome checks did not pass yet. Review the flagged variables above and try again.")
