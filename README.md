# SwiftWyhash

<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg"/></a>
[![Build Status](https://travis-ci.org/lemire/SwiftWyhash.svg?branch=master)](https://travis-ci.org/lemire/SwiftWyhash)

This is an implementation of the random number generator `wyhash` in Swift.

Usage:

```swift
var gen = Wyhash64(seed: 0)
gen.next() // generates a 64-bit random number

(1...10).shuffled(using: &gen)
```

Further reading: [The fastest conventional random number generator that can pass Big Crush?](https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/)

Credit: wyhash was invented by Wang Yi.
