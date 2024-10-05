//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen {
    static func optional(of gen: Gen<T>) -> Gen<T?> {
        return Gen<T?> { rng in
            let (isNil, rng1) = Gen<Bool>.bool().sample(using: rng)
            if isNil {
                return (nil, rng1)
            } else {
                let (value, rng2) = gen.sample(using: rng1)
                return (value, rng2)
            }
        }
    }
}
