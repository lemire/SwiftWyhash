/// Wang Yi's PRNG from wyhash
/// See https://github.com/wangyi-fudan/wyhash/
public struct WyRand: RandomNumberGenerator {
    private var state : UInt64

    init(seed : UInt64) {
        state = seed
    }

    public mutating func next() -> UInt64 {
        state &+= 0xa0761d6478bd642f
        let mul = state.multipliedFullWidth(by: state ^ 0xe7037ed1a0b428db)
        return mul.high ^ mul.low
    }
}
