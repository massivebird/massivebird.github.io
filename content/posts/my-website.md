+++
title = "Making a static site with Zola"
date = 2025-05-12

[extra]
repo_view = true
+++

Let's talk about the making of this website! I hope this inspires you somehow.

# Motivations

I had a few generous goals in mind when making my new website.

1. I don't want to write HTML. I'd rather write in a ✨ totally radical ✨ format like Markdown.
2. I don't want to write CSS. I'd rather outsource the styling to someone else's theme or stylesheet.
3. I want the website to be \[automatically] deployed to GitHub Pages so I can share it with the world.

Can he achieve all of these goals with a single website?? Stay tuned!

> Spoilers: he can, and you're looking at it.

# Avoiding the HTML

Manually writing HTML is _so_ not happening. I want my website to contain blog-style posts; I can't imagine all of the `<p>` tags, repeated boilerplate, and manually maintaining a sorted table of contents.

Luckily, HTML is so universally displeasing that nerds have written complex systems in order to avoid writing it; they're called [static site generators](https://en.wikipedia.org/wiki/Static_site_generator). These programs are capable of producing HTML from more ergonomic formats such as Markdown and TOML.

I chose the [Zola](https://www.getzola.org/) static site engine because it's well-received and has nice theming support. It's also written in Rust! 🦀

With Zola at the wheel, the site's structure and contents are defined by a hierarchy of Markdown files.
When I want to create a new post, I write a new Markdown file. Zola packages it up into a fully styled page, then automatically adds an entry for it in the table of contents.
This is a massive win for ergonomics and sanity.

```
.
├── _index.md
├── about
│   └── _index.md
├── posts
│   ├── _index.md
│   ├── my-website.md
│   ├── old-projects.md
│   └── xor.md
└── projects
    ├── _index.md
    └── projects.toml
```
> A subset of this website's source code file structure. Each Markdown (`.md`) file represents a webpage.

# Avoiding the CSS

I briefly mentioned Zola's support for community themes. The Zola team maintains a curated list of community themes [here](https://www.getzola.org/themes/). There are plenty to choose from, and I change my site's theme often.

> A technical detail: Zola themes are added under a [Git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules), which allows you to reference a Git repo as a subdirectory inside your Git repo.[^git] This is a great way to add dependencies to your project without a dependency manager, and without a nested Git mess.

If this all seems a little too easy, that's because it is. Automated deployment doesn't get any harder.

# Automatic deployment

Since Zola generates static pages, the site doesn't require a backend; that means the website can be hosted for free through GitHub.

Zola's [documentation](https://www.getzola.org/documentation/deployment/github-pages/) provides instructions on configuring a GitHub Action for automatic deployment to GitHub Pages. This pretty much exclusively involves adding a text file to the project. GitHub does all the heavy lifting from there.

# How it's going

Zola has been great to work with. I love using `zola serve`, which builds and serves the site locally, automatically reloading when it detects changes.

That being said, theming gets difficult on the rare occasion — mostly because I change themes regularly. Migrating between themes can be time-consuming since they have different layouts, templates, and frontmatter specs. They might also have URL-sensitive features such as favicons that won't work locally, but _will_ work when deployed through GitHub. The headaches, though, are usually worth the trouble.

Adding new posts is fun, but thinking of interesting topics is difficult. Let me know what I should write about! Or don't.

---

[^git]: [Git - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
