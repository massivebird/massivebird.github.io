+++
title = "Hosting a media server with Jellyfin"
date  = 2025-08-04

[extra]
repo_view = true
+++

<img src="/images/jellyfin.png" alt="The Jellyfin web interface." />

I hoard a lot of media. I collect music, movies, and TV shows, and I have no interest in stopping. I prefer owning my media rather than be at the mercy of renting it from streaming services. Relying on streaming services seems fine until bands like King Gizzard and the Lizard Wizard [start removing](https://variety.com/2025/music/news/king-gizzard-and-the-lizard-wizard-pulls-music-off-spotify-1236470802/) their music from Spotify, in their case to protest company ethics.

It's nice having uninterrupted access to all this media, but sharing files between devices was a nuisance. I keep all my files on my PC, so if I wanted to watch a movie, I copied it to a flash drive and then stuck that into my TV. While functional, it's not exactly a sexy solution. That's where a media server comes in, specializing in making media files accessible across a network.

[Jellyfin](https://jellyfin.org/) is an open-source media server makes sharing media between my PC, TV, laptop, and phone a breeze. All of my shows, movies, and music are stored on my PC, and any device can access the files through the neatly packaged Jellyfin web interface.

## Jellyfin's features

Jellyfin looks and feels premium out of the box. The interface is nicely organized and ported nicely across devices. Since my server is limited to my local network, streaming speeds are fast and responsive, even with an intermediate [proxy server](#introducing-a-reverse-proxy) that I'll discuss later.

As long as your media is [organized properly](https://jellyfin.org/docs/general/server/media/movies/), Jellyfin automatically fetches cover art, genres, acting credits, review scores, and other metadata for all your movies and shows.

The server also supports multiple users with individual permissions set by an admin. For each user, Jellyfin keeps track of what you've watched, and where you left off on unfinished movies or episodes.

## A human-readable address using DNS

My Jellyfin server's initial address was `192.168.1.159:8096`. This is so NOT sexy. I want to type in words, not numbers.

Luckily, my router supports adding custom [Domain Name System](https://en.wikipedia.org/wiki/Domain_Name_System) (DNS) entries. I added one that redirects requests to `jellyfin.local` to the server's IP address. Now, the address becomes `jellyfin.local:8096`.

This is a huge improvement, but the port number is still there! I guess DNS doesn't support binding domain names to specific ports. We'll need another technology to eliminate the port number from the address.

## Introducing a reverse proxy

A [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) is one such approach to getting rid of that port part. This proxy server acts as an intermediate step between the client and the Jellyfin server.

I decided to set up the reverse proxy server on a Raspberry Pi 4 Model B, since I eventually want to migrate my Jellyfin server from my PC to the Pi. I set it up with [Caddy's reverse proxy guide](https://caddyserver.com/docs/quick-starts/reverse-proxy). Let me explain my config file:

```bash
# ~/Caddyfile
jellyfin.local {
	handle_errors 5xx {
		respond "Error: {err.status_code} {err.status_text}. -> Is the Jellyfin server up?"
	}

	handle_errors {
		respond "RIP BOZO. Error: {err.status_code} {err.status_text}"
	}

	reverse_proxy clint.local:8096 # Jellyfin server address
}

pi.local {
	respond "Hello from the pi :3"
}
```

I changed my router's DNS so that `jellyfin.local` and `pi.local` both redirect to the Pi. Caddy catches incoming HTTP/HTTPS requests, and I configured it to respond depending on which domain name was used.

An HTTP/HTTPS request using `pi.local` doesn't do much; Caddy just returns a string. But for requests using `jellyfin.local`, Caddy will serve the Jellyfin server to the client.

In other words, to access my Jellyfin server, all I need to type now is `jellyfin.local`. The request is received by the Pi, then processed by Caddy to serve the media server hosted on my PC.

## Into the future

I'd rather store all my media on a dedicated server instead of my PC. The Pi will be my testing ground for hosting a file and media server simultaneously, then I'll consider upgrading depending on performance.
