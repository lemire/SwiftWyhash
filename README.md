# SwiftWyhash
<a href="https://github.com/apple/swift-package-manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg"/></a>
[![Build Status](https://travis-ci.org/lemire/SwiftWyhash.svg?branch=master)](https://travis-ci.org/lemire/SwiftWyhash)

This is Swift port of pseudorandom number generator `wyrand` from
[wyhash](https://github.com/wangyi-fudan/wyhash) by Wang Yi.

It conforms to [RandomNumberGenerator](https://developer.apple.com/documentation/swift/randomnumbergenerator) protocol.

Usage:

```swift
var gen = WyRand(seed: 42)
gen.next() // generates a 64-bit random number

(1...10).shuffled(using: &gen)
```

For a benchmark, see [SwiftWyhashBenchmark](https://github.com/lemire/SwiftWyhashBenchmark).



Further reading: [The fastest conventional random number generator that can pass Big Crush?](https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/)
