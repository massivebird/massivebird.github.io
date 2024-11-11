+++
title = "arcsearch"
description = "Digital video game archive search tool"
date = 2024-11-11

[extra]
repo_view = true
remote_image = "/projects/arcsearch-demo.png"
+++

![arcsearch-yugioh](/projects/arcsearch-demo.png)

+ [GitHub repository](https://github.com/massivebird/arcsearch)

# Welcome to arcsearch

Arcsearch is a command line utility for searching digital video game archives! Written in [Rust](https://www.rust-lang.org/) 🦀

A _digital video game archive_ — or _archive_, for short — is a directory that contains [retro] games in various ROM and ISO formats.

> When I refer to "arcsearch," I am referring to the _Rust_ project. You can read about the four different arcsearch projects in the _[History](#epilogue-history)_ section.

## Motivation

My archive has more than 1,000 games across thirteen game systems. I wanted a fast and easy way to query my archive, especially to avoid redownloading games I already have in my collection. Windows File Explorer is the worst thing ever, so I decided to write a program myself.

## Features and usage

Arcsearch's queries are executed as [regular expressions](https://en.wikipedia.org/wiki/Regular_expression), which support pattern-matching wildcard characters. For example, I can run a query to return all game titles that contain at least two numeric digits.

This next point is less of a "feature," but is still important to me: arcsearch _looks so good_. For each game that matches the user's query, its title is displayed along with its system. Each system's name can be colored to your preference.

Above all, arcsearch is configurable by a [YAML](https://en.wikipedia.org/wiki/YAML) file. Early versions of arcsearch only worked by hard-coding my archive file structure in the source code. By scrapping that design in favor of an externally-defined config, other users can utilize arcsearch without necessarily altering their preexisting archive.

> You can read more about arcsearch's customization [here](https://github.com/massivebird/arcsearch?tab=readme-ov-file#customization).

## Epilogue — History

Arcsearch has been reborn many times. Let's walk through the saga!

### Act I: Bash

Arcsearch's first version was written in Bash! I wrote this when I was first learning the Linux command line; it was a great opportunity to practice my Bash skills. You can find the latest version of `arcsearch.sh` [here](https://github.com/massivebird/dotfiles/blob/98cd02161010b6b4fd98384dec0b19657f852df9/scripts/arcsearch.sh).

I definitely wouldn't recommend writing something this complex in Bash. Even though it was a pain to write and its runtimes are long, `arcsearch.sh` is totally functional!

> Did you know Bash supports associative arrays? I wish I didn't.

### Act II: C++

To make Arcsearch faster, I rewrote it in C++. I concocted something functional thanks to some prior C++ experience and frantic Googling. The runtimes were incredible compared to Bash, and it became my preferred version for that reason — but I felt empty inside.

I felt like I learned nothing from writing `arcsearch.cpp`. I was (and am) apathetic towards and uninterested in C++ as a language; I didn't feel motivated to improve the project further.

I wanted to write Arcsearch in a fun, performant language that I could comfortably maintain and improve. _Rust's siren call beckoned me._

> `arcsearch.cpp` has been lost to time, but maybe it's for the best.

### Act III: Rust

After my third and final attempt at learning Rust, it stuck. Arcsearch was my first major Rust project, and I am incredibly proud of it. I achieved the performance of C++ _and_ love maintaining it. Arcsearch's Rust implementation remains the most feature-rich and performant version to date.

### Honorable mention: Python

I partially rewrote Arcsearch in Python just to say that I did. I'm not Python's biggest fan, but I'll admit that `arcsearch-py` was really easy to write. The feature set is incomplete, but the program is totally functional. It even supports the same YAML configuration file format as the Rust version!

You can check out [arcsearch-py on GitHub](https://github.com/massivebird/arcsearch-py).
