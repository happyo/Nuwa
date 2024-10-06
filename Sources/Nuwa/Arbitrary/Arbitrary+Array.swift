//
//  Created by happyo on 2024/10/06.
//

import Foundation

extension Array: Arbitrary where Element: Arbitrary {
    public static var arbitrary: Gen<Array<Element>> {
        return Gen<[Element]> { rng in
            let (count, rng1) = Gen<Int>.int(in: 0...20).sample(using: rng)
            return Gen.array(of: Element.arbitrary, count: count).sample(using: rng1)
        }
    }
}
