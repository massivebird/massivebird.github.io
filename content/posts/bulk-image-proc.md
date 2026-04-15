+++
title = "Using imagemagick to crop and resize 100+ photos"
date = 2026-04-14

[extra]
repo_view = true
+++

I've been trying to learn Spanish lately!
I'm trying something new this time: playing a game in Spanish, taking photos of dialogue that I should study, and turning those photos into [Anki](https://apps.ankiweb.net/) flashcards.

> Lately, I've been playing Pokémon Platino, a Latin American Spanish [patch](https://www.romhacking.net/translations/6330/) for Pokémon Platinum on the DS.

The problem is that when I take photos with my phone, they're (1) in high resolution, and (2) taken in portrait mode, meaning there's a lot of wasted space. Across hundreds of photos, these issues mean storage will become an issue quickly.

{{ figure(src="/images/platino-portrait.jpg", alt="A photo of Pokémon Platino", caption="Taking a photo of Pokémon Platino with my phone.") }}

Given the sheer quantity and size of the photos (sometimes 100+ at a time!), I'm definitely not gonna manually crop each photo. There aren't many free options online, either.

Luckily, there's an easy solution to both of these problems!

## Bulk cropping and resizing with imagemagick

[imagemagick](https://imagemagick.org/#gsc.tab=0) is a popular photo processing command-line tool. It allows for bulk, in-place image cropping and resizing, and as a CLI tool, we can write a script too!

```bat
if "%1"=="" goto argerr

magick.exe mogrify -crop 3472x2601+0+950 -resize 400x300 %1\*.jpg
@echo Done!
goto :eof

:argerr
@echo Requires a path argument!
exit /B 1
```

This Windows batch file requires an argument, which points to a directory containing images taken from my phone. The `magick.exe` line first crops the top and bottom out of the image, and then resizes what's left into a 400 x 300 image.

This process converts images of about 4.50 MB down to less than 100 KB! On average, this reduces the total storage size by 95%!!!

To crop and resize all images in `new-photos`, just run the script like so:

```
> optimize.bat .\new-photos\
```
