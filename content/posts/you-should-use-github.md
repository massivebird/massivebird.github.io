+++
title = "You should use GitHub"
date = 2024-07-19

[extra]
repo_view = true
+++

You should use GitHub, especially if you're a programmer. Check out the prerequisite blog post called ["You should learn Git"](@/posts/you-should-learn-git.md) if you're interested.

GitHub is a powerful, cloud-based storage solution for Git repositories! Create remote copies of your projects _and_ take advantage of GitHub's killer features. The service is an industry standard in the software scene (and others) for a reason.

I should mention an important distinction: __Git is a software__ that lives on your computer, and __GitHub is a web platform__.

## What is a repository?

I need to define some terms before we get involved.

For starters, a Git repository or _repo_ is any directory that is "Git-enabled." Repos are identified by the `.git/` subdirectory that contains all of Git's generated data. A repository looks like any other project; the only difference lies in Git's ability to detect and record changes to project files.

A _remote repository_ — often shortened to _remote_ — is a version of your repo that is hosted on a different computer, typically on an online service such as GitHub.

<img src="/images/github-repo.png" alt="image of a GitHub repo" />

> Above: the remote repo for this website! You can find it [here](https://github.com/massivebird/massivebird.github.io) on GitHub.

Local repositories on your computer can be associated with a remote one. This association allows Git to "push" and "pull" changes to/from the remote. More on that in a moment.

## The simple GitHub workflow

If you use GitHub for only one reason, it should be for making backups of your projects. If my hard drive shatters under the [extreme sub-zero temperatures of Vostok, Antarctica](https://wmo.asu.edu/content/world-lowest-temperature), my work is still safely stored on GitHub's servers. The only reason why I don't back up absolutely everything is because I'm lazy; it's dead simple to do.

When I make new changes to my project, I commit them with a `git commit` command, then I run `git push` to send those new changes to the remote. Almost instantly, you can visit the remote in the web browser and see the new commits.

To download an entire project, all you need is a single `git clone <url>` command. This even downloads the project's entire Git commit history. Don't worry — you won't have to completely redownload the project to fetch new updates.

Fetching project updates is extremely simple. I like working on both my laptop and PC, and I can easily sync work between the two. After pushing changes from one machine, all I have to do is run `git pull` on the other. Git inspects the remote, detects new commits, and then applies them to the local copy of the project. With a few inexpensive operations, the same project is now identical on both machines.

Git interfaces with GitHub to make these data transfers extremely simple. Whether you're downloading entire projects, pushing new changes, or pulling the latest updates, the process is easy, fast, and satisfying.

## GitHub's additional features

> If you're already sold on GitHub, you can skip to the [Getting Started](#getting-started) section.

Here are even more features in store for you!

### Issues (as in the feature)

GitHub Issues is a project planning feature available on all repos. Within Issues, users can create posts to request features, report bugs, and more.

You can read more about GitHub Issues [here](https://github.com/features/issues).

### Forks

You can _fork_ anyone's GitHub repository, which creates a copy of the repo under your account. Forks can be freely modified without affecting the original repo, which is great when you want to make some modifications to someone else's work.

You can read more about GitHub forks [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo).

### Pull requests

Pull requests, commonly abbreviated to PRs, enable users to propose project changes. The typical workflow involves creating a fork of a project, committing and pushing changes to your fork, then filing a pull request on the original project repo containing those changes. Your PR might even be approved and merged!

You can read more about GitHub's pull requests [here](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).

### Pages

Create websites from your repositories with GitHub Pages! The website will automatically reflect any changes you make to the repository. This feature is totally free for public repositories. _This website is powered by Pages!_

You can read more about GitHub Pages [here](https://pages.github.com/).

## Getting started

Head over to [github.com](https://github.com/), make an account, and get started with your GitHub journey! I recommend using GitHub's [Explore page](https://github.com/explore) to find projects that interest you.

> By the way, repository URLs are structured like so, which distinguishes the repo's author from the repo name:
> 
> ```
> https://github.com/<user>/<repository>
> ```

## Resources

+ [GitHub Skills](https://skills.github.com/): an official guide to GitHub
