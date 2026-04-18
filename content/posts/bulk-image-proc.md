+++
title = "Using imagemagick to crop and resize 100+ photos"
date = 2026-04-14
updated = 2026-04-17

[extra]
repo_view = true
+++

I've been trying to incorporate Spanish video games into my language studies!
While I play some Pokémon Platinum (in Spanish), I take photos of dialogue that I should study, and later turn those photos into [Anki](https://apps.ankiweb.net/) flashcards.
But I ran into an issue: _too many big photos_.

> Lately, I've been playing Pokémon Platino, a Latin American Spanish [patch](https://www.romhacking.net/translations/6330/) for Pokémon Platinum on the DS.

The problem is that when I take photos with my phone, they're taken in:

1. Excessively high resolution. My flashcards do not need Ultra HD photos.
2. Portrait mode, which leads to wasted space on the top and bottom.

{{ figure(src="/images/platino-portrait.jpg", alt="A photo of Pokémon Platino", caption="Taking a photo of Pokémon Platino with my phone.") }}

I'm taking _hundreds_ of photos, so with these issues, I end up taking _gigabytes_ of photos in a session. Especially for the sheer quantity of images, I couldn't find a reliable bulk image processor online. I'm definitely not going to manually crop every single picture, girl!

Luckily, I found a free, convenient, and offline solution to both of these problems!

## Bulk cropping and resizing with imagemagick

[imagemagick](https://imagemagick.org/#gsc.tab=0) is like the ffmpeg of images. It's a popular photo processing command-line tool that offers bulk image cropping and resizing.

Since it's a CLI tool, it's super easy to write an imagemagick command into a reusable script! I make the flashcards on my Windows PC, so I opted for a Windows batch file (🤮). The script requires a single argument, which is a path pointing to a directory of images taken from my phone. `magick.exe` first crops the top and bottom out of the image, and then downsizes the result into a 400x300 resolution.

```bat
if "%1"=="" goto argerr

magick.exe mogrify -crop 3472x2601+0+950 -resize 400x300 %1\*.jpg
@echo Done!
goto :eof

:argerr
@echo Requires a path argument!
exit /B 1
```

Running the script to crop/resize all images in the `new-photos` folder looks like this:

```
> optimize.bat .\new-photos\
```

On average, I observed 4.50 MB images become roughly 100 KB! That's a __95%__ file size reduction!!
