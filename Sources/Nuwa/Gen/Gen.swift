//
//  Created by happyo on 2024/10/05.
//

import Foundation

public struct Gen<T> {
    public let generate: (RandomNumberGenerator) -> (T, RandomNumberGenerator)

    // 基本的构造函数
    public init(_ generate: @escaping (RandomNumberGenerator) -> (T, RandomNumberGenerator)) {
        self.generate = generate
    }

    // 返回一个值和新的生成器状态
    public func sample(using rng: RandomNumberGenerator) -> (T, RandomNumberGenerator) {
        return generate(rng)
    }

    // 映射函数，将生成的值进行转换，生成新的 Gen
    public func map<U>(_ f: @escaping (T) -> U) -> Gen<U> {
        return Gen<U> { rng in
            let (value, newRng) = self.sample(using: rng)
            return (f(value), newRng)
        }
    }
}
