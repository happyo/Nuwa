//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen {
    static func dictionary<K, V>(keyGen: Gen<K>, valueGen: Gen<V>, count: Int) -> Gen<[K: V]> where K: Hashable {
        return Gen<[K: V]> { rng in
            var rngCopy = rng
            var dict: [K: V] = [:]
            for _ in 0..<count {
                let (key, newRng1) = keyGen.sample(using: rngCopy)
                let (value, newRng2) = valueGen.sample(using: newRng1)
                dict[key] = value
                rngCopy = newRng2
            }
            return (dict, rngCopy)
        }
    }
}
