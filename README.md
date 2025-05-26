# SwiftWyhash

This is Swift port of pseudorandom number generator `wyrand` from [wyhash](https://github.com/wangyi-fudan/wyhash) by Wang Yi. On 64-bit hardware, it is should be effectively faster than any other commonly available random number generator. It meets  quality standards: it passes Big Crunch.

It conforms to [RandomNumberGenerator](https://developer.apple.com/documentation/swift/randomnumbergenerator) protocol.

Usage:

```swift
var gen = WyRand(seed: 42)
gen.next() // generates a 64-bit random number

(1...10).shuffled(using: &gen)
```

For a benchmark, see [SwiftWyhashBenchmark](https://github.com/lemire/SwiftWyhashBenchmark).



Further reading: [The fastest conventional random number generator that can pass Big Crush?](https://lemire.me/blog/2019/03/19/the-fastest-conventional-random-number-generator-that-can-pass-big-crush/)
