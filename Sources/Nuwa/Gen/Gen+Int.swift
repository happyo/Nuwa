//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen where T == Int {
    static func int(in range: ClosedRange<Int>) -> Gen<Int> {
        return Gen { rng in
            var rngCopy = rng
            let value = Int.random(in: range, using: &rngCopy)
            return (value, rngCopy)
        }
    }
}
