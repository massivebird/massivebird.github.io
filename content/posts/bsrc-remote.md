+++
title = "Querying remote file systems with bsrc 0.4.x"
date = 2026-02-27

[extra]
repo_view = true
+++

With [bsrc](https://github.com/massivebird/bsrc) 0.4.x, you can now search for files on other computers! So awesome!

```sh
# e.g., searching for Pokemon games stored on my Windows PC, from
# my Linux laptop
$ bsrc --remote bird@192.168.1.130 "pokemon" /H:/game-archive
```

You can even define _presets_ and query your favorite directories (local or remote) without typing paths or credentials.

```toml
# $HOME/.config/bsrc/presets.toml
[presets.remote_games]
host = "192.168.1.130"
user = "bird"
path = "/H:/game-archive/"
```

```sh
# Equivalent to the previous command
$ bsrc --preset remote_games "pokemon"
```

The convenience of remote queries can't be understated. I love these two features, and I learned a lot developing them. I'll discuss my experience a bit, if you're interested.

## Lore drop

Windows being shitty and opaque inspired the remote query feature. What else is new?

TLDR, I couldn't figure out how to resize my PC's Ubuntu WSL partition (it was like 30 GB, mostly unused), so I uninstalled it, which meant losing bsrc, but I still wanted to query my game collection.

## Conceptualization

A seven syllable word is a little overkill for describing my refusal to deal with user passwords. All I knew was that I wanted to defer authentication to some other program.

I knew that programs like `sftp` are built on top of the SSH protocol, so I figured I could somehow leverage SSH's public-key authentication mechanisms to establish a remote connection _without_ dealing in passwords.

The problem was that, of course, I had no idea how to do that.

> Even if SSH protects passwords in transit, I'm still concerned about:
> 1. Passwords being stored in memory, possibly remedied by crates like [`secrecy`](https://crates.io/crates/secrecy).
> 2. Passwords typed as plaintext command arguments, visible in the user's command line history.
>
> I _could_ read an encrypted password from a file, but I'd rather not ask the user to do all that.
> Too much overhead, and atrocious marketing.

## Development

I'll keep this brief! I first tried the [`remotefs-ssh`](https://crates.io/crates/remotefs-ssh) crate. I actually managed to make fully functional remote queries, but only with password authentication; I couldn't find support for public keys.

I could have tried a different protocol or high level crate, but for some reason, I was determined to keep trying SSH. So I turned to the lower level [`ssh2`](https://crates.io/crates/ssh2) crate, on top of which `remotefs-ssh` is built. I was intimidated since I'm inexperienced with networking concepts, but `ssh2` has life-saving documentation with awesome code snippet examples that carried me through it.

I finally achieved public key auth, and I didn't even lose much abstraction or convenience after switching dependencies (omitting the initial learning curve ^_^). I'm glad I survived the scary, low level mechanisms and learned some cool networking tech.
