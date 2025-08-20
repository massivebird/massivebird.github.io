+++
title = "Hosting a media server with Jellyfin"
date  = 2025-08-19

[extra]
repo_view = true
+++

<img src="/images/jellyfin.png" alt="The Jellyfin web interface." />

I've been using [Jellyfin](https://jellyfin.org/) to stream my collection of movies and shows from my PC to my laptop, phone, and TV. Jellyfin is an open-source media server that makes local media accessible across devices through a neatly packaged web interface.

> Quick aside: I collect music, movies, and TV shows because I prefer to own my media rather than be stuck renting from streaming services. The latter seems reliable until one of your favorite bands [removes their music from Spotify](https://variety.com/2025/music/news/king-gizzard-and-the-lizard-wizard-pulls-music-off-spotify-1236470802/) in protest of company ethics, or Netflix [delists a bunch of titles](https://www.whats-on-netflix.com/leaving-soon/whats-leaving-netflix-in-september-2025/) you were dying to watch.

This is a summary of my experience with Jellyfin.

## Jellyfin's features

Jellyfin looks and feels premium out of the box. The interface is neatly organized and ported nicely across devices. Since my server is limited to my local network, streaming speeds are fast and responsive, even with an intermediate [proxy server](#introducing-a-reverse-proxy) that I'll discuss later.

As long as your media is [organized properly](https://jellyfin.org/docs/general/server/media/movies/), Jellyfin automatically fetches cover art, genres, acting credits, review scores, and other metadata for all your movies and shows.

<img src="/images/jellyfin-movie.png" alt="A movie and its metadata." />

The server also supports multiple users with individual permissions set by an admin. For each user, Jellyfin keeps track of what you've watched, and where you left off on unfinished movies or episodes.

The project also features a plugin for sharing e-books, audiobooks, and comics, which I'm tempted to try out.

## Networking improvements

Jellyfin itself was easy to set up and works great, but I always find something to complain about. My server's initial address was `192.168.1.159:8096`, which is so NOT sexy. I want to type in words, not numbers. This is _not_ a Jellyfin problem; this is a computer networking problem.

### A human-readable address using DNS

Luckily, my router supports adding custom [Domain Name System](https://en.wikipedia.org/wiki/Domain_Name_System) (DNS) entries. I added one that redirects local requests to `jellyfin.local` to the server's IP address at `192.168.1.159`. With DNS configured, the address becomes `jellyfin.local:8096`.

This is a huge improvement, but the port number is still there! I guess DNS doesn't support binding domain names to specific ports. We'll need another technology to eliminate the port number from the address.

### Introducing a reverse proxy

A [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) is one such approach to getting rid of that pesky port part. The proxy server acts as an intermediate step between the client and the Jellyfin server. I chose to use [Caddy](https://caddyserver.com/) as my reverse proxy server, but it's incredibly customizable and can do a lot more than that.

I decided to set up the reverse proxy server on my Raspberry Pi 4, since I eventually want to migrate the Jellyfin server from my PC to the Pi. I set it up with Caddy's [reverse proxy guide](https://caddyserver.com/docs/quick-starts/reverse-proxy). Let me explain my config file:

```bash
# ~/Caddyfile
jellyfin.local {
  # Handle error codes 5XX
	handle_errors 5xx {
		respond "Error: {err.status_code} {err.status_text}. -> Is the Jellyfin server up?"
	}

  # Generic error handling
	handle_errors {
		respond "RIP BOZO. Error: {err.status_code} {err.status_text}"
	}

	reverse_proxy clint.local:8096 # Jellyfin server address
}

pi.local {
	respond "Hello from the pi :3"
}
```

I configured my router's DNS again so that `jellyfin.local` and `pi.local` both correspond to the Pi's IP. Caddy catches incoming HTTP/HTTPS requests and is configured to respond depending on which domain name was used.

An HTTP/HTTPS request using `pi.local` doesn't do much; Caddy just returns a string. But for requests using `jellyfin.local`, Caddy will serve the Jellyfin server to the client.

In other words, to access my Jellyfin server, all I need to type in is `jellyfin.local`. The request is received by the Pi, then processed by Caddy to serve the media server hosted on my PC.

## Into the future

I'm very happy with Jellyfin, and I can't wait to grow my film collection!

Eventually, the reverse proxy and media server will live on a dedicated machine. The Pi will be my testing ground for hosting a reverse proxy, file server, and media server simultaneously. I'll consider upgrading hardware depending on the Pi's performance.
