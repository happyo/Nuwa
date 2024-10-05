//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen where T == String {
    static func string(length: Int) -> Gen<String> {
        return Gen<String> { rng in
            var rngCopy = rng
            let characters: [Character] = (0..<length).map { _ in
                let (char, newRng) = Gen<Character>.char().sample(using: rngCopy)
                rngCopy = newRng
                return char
            }
            return (String(characters), rngCopy)
        }
    }

    static func string(range: ClosedRange<Int>) -> Gen<String> {
        return Gen<String> { rng in
            let (length, rng1) = Gen<Int>.int(in: range).sample(using: rng)
            let (str, rng2) = Gen<String>.string(length: length).sample(using: rng1)
            return (str, rng2)
        }
    }
}
