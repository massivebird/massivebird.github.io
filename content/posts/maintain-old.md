+++
title = "Learn from your old projects"
date = 2025-05-11

[extra]
repo_view = true
+++

We all know the feeling of looking through an old project and being completely lost. _What does this variable do? Why did I decide to do that? What the hell was I thinking?_

If you have these thoughts, that means your code can be improved! After you get your laughs in, I challenge you to __maintain that project__! This is the perfect opportunity to practice _improving_ or _rewriting_ an existing codebase that might as well been written by someone else.

On top of practicing your coding literacy, you might even recognize new ways to implement features or make optimizations to improve performance.

For some motivation, here are some examples of my own projects that I revisited and revitalized :3

# Arcsearch: introducing async

[massivebird/arcsearch](https://github.com/massivebird/Arcsearch) is a tool I use to search through my retro game library. I have over one thousand ROMs and ISOs across plenty of platforms, and Arcsearch makes it so easy to search though that collection.

I used it for the first time in a while, and I was underwhelmed by its performance. I looked through the source code and was shocked — I never implemented asynchronous operations! When I originally wrote Arcsearch, I had no clue how to implement async ops with a deterministic output. Revisiting the code months later, I had a promising idea within minutes.

By this point, I had read a decent chunk of [_Asynchronous Programming in Rust_](https://rust-lang.github.io/async-book/), and I had made plenty of asynchronous programs using the [Tokio](https://tokio.rs/) async runtime.

Within an hour, I improved Arcsearch's runtime performance by approximately 60% (from 660ms to 220ms). It's almost _too_ fast now.

# Funky Board: a total rewrite

[massivebird/funky_board](https://github.com/massivebird/funky_board) is a [zero-player game](https://en.wikipedia.org/wiki/Zero-player_game) that I originally wrote in Java for a final project in college. I ported it over to Rust as one of my first major Rust projects.

> My first attempt at writing a Rust port of Funky Board ended catastrophically. I was in the middle of reading [The Rust Book](https://rust-book.cs.brown.edu/experiment-intro.html), and needless to say, I was not prepared. I got overwhelmed, and in my frustration, I gave up on learning Rust for a couple months.

You can check out the repo for a detailed look into the rules. Basically, autonomous pieces move around a board and capture other pieces by landing on them, similar to chess.

I revisited my Rust port with disgust. My code relied heavily on `.clone()` (an undesirable, computationally expensive crutch), and my data structures were morbidly designed. Eliminating the former is an exercise in navigating Rust's complex borrow checker rules, and I wanted to prove that I was finally capable of doing it. Alongside fixing the latter, I chose to start from scratch.

[_Learning Rust With Entirely Too Many Linked Lists_](https://rust-unofficial.github.io/too-many-lists/) prepared me for this moment. I was ready to flex my interior mutability muscles, design decent data structures with sensible APIs, and most importantly, rationalize about Rust's borrow checker. In the end, I proved myself capable, and a new Funky Board was born.

This evolved Funky Board is a dramatic improvement in readability _and_ functionality. On top of that, I'm extremely proud of untangling the immutable reference spaghetti and eliminating all those `.clone()` calls. I even threw in a [strategy design pattern](https://rust-unofficial.github.io/patterns/patterns/behavioural/strategy.html) using Rust's trait objects, which makes adding new movement types trivial.
