# check_fuel_burn_loop.py
#
# Practice problem checker for ENAE202 - For Loops.
# Save this file in the same folder as your fuel_burn_loop.py script,
# then run "python check_fuel_burn_loop.py" from a terminal.

import os
import runpy

SCRIPT = "fuel_burn_loop.py"

if not os.path.isfile(SCRIPT):
    raise FileNotFoundError(
        f"Could not find {SCRIPT} in the current folder. Save your script there, "
        "and run this checker from the same folder."
    )

ns = runpy.run_path(SCRIPT)

print("\n--- Checking your answers ---")
all_correct = True
tol = 1e-3

name = "total_burned_lb"
expected = 1685
if name not in ns:
    print(f'[MISSING] {name} is not defined. Did you name your variable exactly "{name}"?')
    all_correct = False
else:
    val = ns[name]
    if abs(val - expected) / abs(expected) < tol:
        print(f"[PASS] {name} = {val}")
    else:
        print(f"[FAIL] {name} = {val} (that doesn't look right - check your formula)")
        all_correct = False

name = "fuel_remaining"
expected = [2550, 2120, 1710, 1315]
if name not in ns:
    print(f'[MISSING] {name} is not defined. Did you name your variable exactly "{name}"?')
    all_correct = False
else:
    val = ns[name]
    if list(val) == expected:
        print(f"[PASS] {name} = {val}")
    else:
        print(f"[FAIL] {name} = {val} (that doesn't look right - check your loop logic)")
        all_correct = False

if all_correct:
    print("\nAll checks passed! Nice work.")
else:
    print("\nSome checks did not pass yet. Review the flagged variables above and try again.")
