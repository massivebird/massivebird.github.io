+++
title = "Renouncing Spotify"
date = 2024-11-14

[extra]
repo_view = true
+++

I cancelled my Spotify subscription a few months ago. Spotify sucks as an app and as a service.

As a service, Spotify kept me around with its playlists and social ubiquity. The platform is great at scratching that social media itch; I loved maintaining and sharing my Spotify playlists, especially since it seems like _everyone_ has Spotify. I'm addicted to the feeling of someone saving my Spotify playlist.

All that said, the mobile and web apps pushed me to my limit. The rare yet totally bizarre UI/UX updates have severely bastardized the end user experience. The mobile app feels awful to navigate, and I still get this web app bug where it just refuses to play music sometimes.

This was also when I realized the ownership implications. Spotify doesn't sell you music — it sells you the temporary privilege of listening to _their_ music on _their_ time. You're locked into listening through their shitty apps or relying on their limited API.

## My music is my music

<!-- I didn't want Spotify controlling the way I experience my music. -->

I needed to own all my music locally. That's easier said than done, especially as someone who can't justify subscribing to a VPN but is too scared to torrent without one. Some careful researching led me to an open-source project called _zspotify_ that rips music off of Spotify. Zspotify exists in many forms (such that I couldn't even tell who had first created it), so I'll let you find it.

> Zspotify's killer feature is _real-time downloading_. For example, a two minute song is downloaded chunks over the span of two minutes. This is designed to mimic normal playback traffic; otherwise, Spotify might smell something fishy and lock your account. I always opt for real-time downloading just to be safe.

After forking Zspotify and adding some improved exception handling, the experience has been great. I can queue up a ton of albums, check in every few hours, and add more albums to the queue when possible.
