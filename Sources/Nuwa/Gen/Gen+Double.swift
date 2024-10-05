//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen where T == Double {
    static func double(in range: ClosedRange<Double>) -> Gen<Double> {
        return Gen { rng in
            var rngCopy = rng
            let value = Double.random(in: range, using: &rngCopy)
            return (value, rngCopy)
        }
    }
}
