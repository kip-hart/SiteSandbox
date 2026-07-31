# check_altitude_conversion.py
#
# Practice problem checker for ENAE202 - Input & Data Types.
# Save this file in the same folder as your altitude_conversion.py script,
# then run "python check_altitude_conversion.py" from a terminal.

import builtins
import os
import runpy

SCRIPT = "altitude_conversion.py"

if not os.path.isfile(SCRIPT):
    raise FileNotFoundError(
        f"Could not find {SCRIPT} in the current folder. Save your script there, "
        "and run this checker from the same folder."
    )

builtins.input = lambda prompt="": "1000"
ns = runpy.run_path(SCRIPT)

print("\n--- Checking your answers ---")
all_correct = True
tol = 1e-3

name = "altitude_ft"
expected = 3281.0
if name not in ns:
    print(f'[MISSING] {name} is not defined. Did you name your variable exactly "{name}"?')
    all_correct = False
else:
    val = ns[name]
    if abs(val - expected) / abs(expected) < tol:
        print(f"[PASS] {name} = {val}")
    else:
        print(f"[FAIL] {name} = {val} (that doesn't look right - check your conversion formula)")
        all_correct = False

if all_correct:
    print("\nAll checks passed! Nice work.")
else:
    print("\nSome checks did not pass yet. Review the flagged variables above and try again.")
