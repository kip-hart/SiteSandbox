---
title: Live Scripts
---

Live scripts are similar to [published scripts]({{ site.baseurl }}{% link matlab/publishing.md %}), with one main difference: results are recalculated live, right below the code that produced them, as you edit.
This is an interactive experience, where you can adjust the inputs to the script and immediately see the effects on outputs, formatted text, and plots, without needing to run a separate `publish` command.

To create one, use the Home tab's **New Live Script** button, or save an existing script with the `.mlx` file extension instead of `.m`.
The Live Editor splits the window into a code area on the left and the corresponding output - text, tables, or figures - on the right, updating automatically each time you run a section.

Because `.mlx` files store rich text and figures together with the code, they aren't plain text like `.m` files, so they don't work as well with version control tools like Git.
For that reason, this course sticks with plain `.m` scripts, but live scripts are worth knowing about for your own note-taking or for presenting results.

More details about live scripts are on the [Create Live Scripts in the Live Editor](https://www.mathworks.com/help/matlab/matlab_prog/create-live-scripts.html) page.
