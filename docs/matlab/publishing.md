---
title: Publishing Scripts
---

MATLAB scripts are written in plain text `.m` files, which can be difficult to read and
do not contain any of the results from running the script.
Publishing the script converts the plain text to rich text PDFs that are easy to read and contain the results.
With the Boeing 737 center-of-mass example from the [User Scripts]({{ site.baseurl }}{% link matlab/scripts.md %}) page, the comments certainly clarify what the script is doing,
but it would be easier to read as a PDF.
A PDF is also easier to share with someone who does not have MATLAB installed, or does not have time to rerun your script if
it contains slow operations.

To convert a script into a PDF (or other formats), use the `publish` command. For example:

```matlab
publish('center_of_mass_737.m', 'pdf');
```

The PDF produced by this command is [center_of_mass_737.pdf]({{ site.baseurl }}/assets/published/center_of_mass_737.pdf).

<object data="{{ site.baseurl }}/assets/published/center_of_mass_737.pdf" type="application/pdf" width="100%" height="135px">
    <p>Unable to display PDF.</p>
</object>

MATLAB provides more details on the publishing process on their [publish](https://www.mathworks.com/help/matlab/ref/publish.html) page.
For more information on formatting text in the comments, visit [Publishing Markup](https://www.mathworks.com/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html).
