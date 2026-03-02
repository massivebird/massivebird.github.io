+++
title = "Randomly delete half your files with Lots"
date = 2026-03-02

[extra]
repo_view = true
+++

The other day, I figured it would be cool to randomly delete half of all my computer files. So I wrote a program that helps me do that! It's called [lots](https://github.com/massivebird/lots), named after the form of [cleromancy](https://en.wikipedia.org/wiki/Cleromancy) mentioned frequently in the Bible. I leave the fate of my `/boot/loader/` to Him.

Lots doesn't actually delete or modify files itself; it returns a randomly-selected list of files, which you can then pipe into other commands.

```sh
# WARNING!!!! DO NOT RUN THIS LMAO

$ lots | xargs rm
#        ^
#        Executes the `rm` command for each file.
```

<!-- > Having intrusive thoughts? What if you accidentally clone my project, then copy-paste the above in your terminal? -->
<!-- > That would be crazy. But also really funny. Why would you ever do that? You're itching to do it. -->

I chose this design for several reasons:

+ __Flexibility__: You can pipe the output into anything you want! `vim`, `git`, `rsync`, I don't ask questions.
+ __Customization__: Lots features a suite of options specialized for file selection, such as percentage-based or value-based selection strategies, recursive depth limits, and various filtering options.
+ __Safety__: Nuking half your files with a short command like `lots` would be beyond terrifying. This selection-oriented style prevents the user from accidentally Thanos snapping their system.

## More examples

```sh
# Randomly delete a single file on your computer.
$ lots -n1 | rm
```

```sh
# Randomly print the basename of 32% of your elephant photos.
$ lots -p32 ~/Pictures/elephants/ | xargs --max-args 1 basename
```
