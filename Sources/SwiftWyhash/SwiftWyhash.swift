public struct Wyhash64: RandomNumberGenerator {
    private var state : UInt64

    init(seed : UInt64) {
        self.state = seed
    }

    public mutating func next() -> UInt64 {
        self.state &+= 0x60bee2bee120fc15
        let t1 = self.state.multipliedFullWidth(by: 0xa3b195354a39b70d)
        let m1 = t1.high ^ t1.low
        let t2 = m1.multipliedFullWidth(by: 0x1b03738712fad5c9)
        let m2 = t2.high ^ t2.low
        return m2
    }
}
