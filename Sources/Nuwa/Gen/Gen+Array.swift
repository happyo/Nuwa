//
//  Created by happyo on 2024/10/05.
//

import Foundation

public extension Gen {
    static func array(of gen: Gen<T>, count: Int) -> Gen<[T]> {
        return Gen<[T]> { rng in
            var rngCopy = rng
            var array: [T] = []
            for _ in 0..<count {
                let (element, newRng) = gen.sample(using: rngCopy)
                array.append(element)
                rngCopy = newRng
            }
            return (array, rngCopy)
        }
    }

    static func array(of gen: Gen<T>, range: ClosedRange<Int>) -> Gen<[T]> {
        return Gen<[T]> { rng in
            let (count, rng1) = Gen<Int>.int(in: range).sample(using: rng)
            
            return Gen.array(of: gen, count: count).sample(using: rng1)
        }
    }
}
