+++
title = "arcsearch"
description = "Digital video game archive search tool"

[extra]
remote_image = "https://camo.githubusercontent.com/6ca2bef433728d18b832c7f1272b0662b182726824f5c1dbc2f2082cf6c6a42a/68747470733a2f2f696d6775722e636f6d2f623868667a464e2e676966"
+++

# What is arcsearch?

Arcsearch is a command line utility for searching digital video game archives!

A _digital video game archive_ — or _archive_, for short — is a directory that contains [retro] games in various ROM and ISO formats.

## Motivation

My archive has more than 1,000 games across thirteen game systems. I wanted a fast and easy way to query my archive, especially to avoid redownloading games I already have in my collection. Windows File Explorer definitely wasn't cutting it, so I decided to write a program myself.

## Driven by regular expressions

Arcsearch performs queries as case-insensitive [regular expressions](https://en.wikipedia.org/wiki/Regular_expression), which means you can search using wildcard symbols and other patterns. This makes searching way more convenient.

> Plus, you can get answers to questions such as "how many games in my archive have a number in the title?"

## Act I: Bash

Arcsearch's first version was written in Bash!

I first wrote Arcsearch in Bash when I was first learning the Linux command line. You can find the current version of `arcsearch.sh` [here](https://github.com/massivebird/dotfiles/blob/98cd02161010b6b4fd98384dec0b19657f852df9/scripts/arcsearch.sh).

Writing this was pretty annoying since Bash isn't designed around ergonomics. Although the runtimes are 10+ seconds on my massive archive, `arcsearch.sh` is totally functional!

> Did you know Bash supports associative arrays? I wish I didn't.

## Act II: C++

A short college assignment was a great motivator to rewrite Arcsearch in C++.

## Act III: Rust

## Act III.2: Python

## Written in 

## not sure where to put this

Arcsearch requires the following archive system-game subdirectory structure:

```
/game/archive/root
├── ds
│   ├── game-1.nds
│   ├── game-2.nds
│   └── game-3.nds
├── wii
│   ├── game-1-dir
│   │   └── game-1.wbfs
│   └── game-2-dir
│       └── game-2.wbfs
└── config.yaml
```
