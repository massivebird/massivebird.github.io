+++
title = "Alternating values with XOR"
date = 2025-02-04

[extra]
repo_view = true
+++
<link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
<link rel="manifest" href="/favicon/site.webmanifest">

__XOR__ (__exclusive or__) is one of my favorite logical operations! XOR stands for _exclusive or_ since it's a variant of the logical _OR_ operation. XOR takes two operands and returns `1` if and only if exactly one operand is `1`.

| x | y | x XOR y |
| - | - | - | 
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

> You can experiment with XOR with this [online XOR calculator](https://xor.pw/#).

When the operands contain multiple bits, XOR is performed _bitwise_, meaning the first bit of `x` is XOR'd with the first bit of `y`, then the second bits XOR'd with each other, and so on.

This can be used to alternate some numeric variable between two values! The easiest example is using a single bit to alternate between `0` and `1`:

```
mask = 1;

1 XOR mask = 0

0 XOR mask = 1
```

But what if you want to alternate between other values, like `17` and `5`? Whatever your operands are, the mask is equal to `x XOR y`! Wow!

```
mask = 17 XOR 5 = 12

17 XOR mask = 5

5 XOR mask = 17
```

Okay, the practical applications might be limited at first glance. I still love this trick, especially as an aspiring low-level programmer. Check out this cool Fibonacci sequence generator I wrote in Rust:

```rust
// Returns the nth element in the Fibonacci sequence.
fn nth_fib(n: usize) -> u128 {
    let mut work: [u128; 2] = [0, 1];

    let mut idx: usize = 0;

    for _ in 2..=n {
        work[0]
            .checked_add(work[1]) // Return `None` if an overflow occurs.
            .map_or_else(|| panic!("Overflowed!"), |n| work[idx] = n);

        // Alternate between 0 and 1
        idx ^= 0x1;
    }

    work[idx]
}
```
