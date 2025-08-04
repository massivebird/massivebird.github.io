+++
title   = "Hosting a media server with Jellyfin"
date    = 2025-08-04

[extra]
repo_view = true
+++

I hoard a lot of media. I collect music, movies, and TV shows, and I have no interest in stopping. I prefer owning my media rather than be at the mercy of renting it from streaming services. Relying on streaming services seems fine until bands like King Gizzard and the Lizard Wizard [start removing](https://variety.com/2025/music/news/king-gizzard-and-the-lizard-wizard-pulls-music-off-spotify-1236470802/) their music from Spotify, in their case to protest company ethics.

It's nice having uninterrupted access to all this media, but sharing files between devices was a nuisance. I keep all my files on my PC, so if I wanted to watch a movie, I copied it to a flash drive and then stuck that into my TV. While functional, it's not exactly a sexy solution. That's where a media server comes in, specializing in making media files accessible across a network.

[Jellyfin](https://jellyfin.org/) is an open-source media server makes sharing media between my PC, TV, laptop, and phone a breeze. All of my shows, movies, and music are stored on my PC, and any device can access the files through the neatly packaged Jellyfin web interface.

<img src="/images/jellyfin.png" alt="The Jellyfin web interface." />

## A reverse proxy for elegance

## Into the future

I'd rather store all my media on a dedicated server instead of my PC. A dedicated machine could run 24/7, which means I wouldn't have to run upstairs to boot up my PC just to watch a show in my living room. I'll probably get an external hard drive, plug it into my Pi, and see if I can configure it into some sort of NAS.
