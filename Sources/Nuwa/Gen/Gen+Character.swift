//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen where T == Character {
    static func char() -> Gen<Character> {
        return Gen<Character> { rng in
            let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
            var rngCopy = rng
            let index = Int.random(in: 0..<letters.count, using: &rngCopy)
            return (letters[index], rngCopy)
        }
    }
}
