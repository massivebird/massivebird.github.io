+++
title = "MATLAB, the anti-programming language"
date = 2025-99-99

[extra]
repo_view = true
+++

> "MATLAB combines a desktop environment tuned for iterative analysis and design processes __with a programming language__ that expresses matrix and array mathematics directly."
>
> — [MathWorks](https://www.mathworks.com/products/matlab.html)

MATLAB is a desktop/web app that markets itself as an effective tool for data analysis, data visualization, machine learning, and more. All of these are made possible through their first-party language, which also goes by the name of MATLAB.

I recently revisited MATLAB for a course on information retrieval, and I was excited to try it again. My prior experience with MATLAB was around four years ago during a multivariable calculus course (don't ask me how that went). In those four years, I've grown a lot as a person and as a software developer. Maybe it won't be so bad this time.

Unfortunately, nothing can save you from MATLAB. I'm almost convinced that the language is designed to be awful. I'm not a programming language design expert, but MATLAB is not passing the vibe check.

## Contextual behavior

<!-- Let me get some syntax out of the way. I promise, I won't teach you any more MATLAB than is necessary. -->

<!-- When constructing a matrix in MATLAB, a semicolon (`;`) is used to separate rows of elements. This is how we create our two-dimensional matrix below. -->

<!-- Ranges are often used to index subsections of matrices. The syntax `a:b` expands to "all integers in the inclusive range $[a, b]$." A colon by itself (`:`) expands to "all possible values/rows/columns/whatever." -->

Here is some very basic matrix indexing in MATLAB.

```matlab
arr = [0 2 4 8];

% Retrieve and mutate a copy of the first value.
first_copy = arr(1, 1);
first_copy = 9;

assert(isequal(first_copy, 9));
assert(isequal(arr(1, 1), 0));
```

Notice how this indexing returns an integer, and this integer can be mutated without mutating the original matrix. Okay!

Not okay. Let's use the same exact syntax in a different context:

```matlab
mat = [1 2];

mat(1, 1) = 0;

assert(isequal(mat, [0 2]));
```

We just used the same syntax, not to copy the data, but rather to reassign a positional element. An entirely different behavior has occurred, pretty much solely because the syntax appeared on the other side of the assignment operator (`=`).

This is awful feng shui, and it's only one small example in a bloated language. Overloading operators is one thing, but overloading syntactic rules is so counter-intuitive. Sheer memorization is the only way to prepare yourself for this type of chaos.

## Parameters

Before you get sick of the word _overloading_, here's some more:
