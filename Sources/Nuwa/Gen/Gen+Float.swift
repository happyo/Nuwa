//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen where T == Float {
    static func float(in range: ClosedRange<Float>) -> Gen<Float> {
        return Gen { rng in
            var rngCopy = rng
            let value = Float.random(in: range, using: &rngCopy)
            return (value, rngCopy)
        }
    }
}
