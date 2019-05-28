# SwiftWyhash

This is an implementation of the random number generator wyhash in Swift.

Usage:

```swift
let gen = WyhashGenerator(userSeed: 0)
gen.random() // generates a 64-bit random number
```

Further reading: [The fastest conventional random number generator that can pass Big Crush?](https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/)
