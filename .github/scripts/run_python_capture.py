import runpy
import sys
import warnings

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

# A real, interactive plt.show() doesn't warn. This warning is purely an
# artifact of the headless Agg backend used to run scripts in CI.
warnings.filterwarnings(
    "ignore",
    message="FigureCanvasAgg is non-interactive, and thus cannot be shown",
)

entry = sys.argv[1]
runpy.run_path(entry, run_name="__main__")

for i, fignum in enumerate(plt.get_fignums(), start=1):
    fig = plt.figure(fignum)
    fig.savefig(f"Figure_{i}.png")
