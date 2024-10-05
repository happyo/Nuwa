//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen where T == Bool {
    static func bool() -> Gen<Bool> {
        return Gen { rng in
            var rngCopy = rng
            let value = Bool.random(using: &rngCopy)
            return (value, rngCopy)
        }
    }
}
