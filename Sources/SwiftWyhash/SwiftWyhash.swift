/*uint64_t wyhash64_stateless(uint64_t *seed) {
  *seed += UINT64_C(0x60bee2bee120fc15);
  __uint128_t tmp;
  tmp = (__uint128_t)*seed * UINT64_C(0xa3b195354a39b70d);
  uint64_t m1 = (tmp >> 64) ^ tmp;
  tmp = (__uint128_t)m1 * UINT64_C(0x1b03738712fad5c9);
  uint64_t m2 = (tmp >> 64) ^ tmp;
  return m2;
}*/

class WyhashGenerator {
    var seed : UInt64

    let multiplier1 : UInt64 = 0xa3b195354a39b70d
    let multiplier2 : UInt64 = 0x1b03738712fad5c9
    let increment : UInt64 = 0x60bee2bee120fc15

    init(userSeed : UInt64) {
        seed = userSeed;
    }

    func random() -> UInt64 {
        seed &+= increment
        let fullmult1 = seed.multipliedFullWidth(by: multiplier1)
        let m1 = fullmult1.high ^ fullmult1.low;
        let fullmult2 = m1.multipliedFullWidth(by: multiplier2)
        let m2 = fullmult2.high ^ fullmult2.low;
        return m2
    }
}
