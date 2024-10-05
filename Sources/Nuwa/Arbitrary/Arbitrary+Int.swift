//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Int: Arbitrary {
    public static var arbitrary: Gen<Int> {
        return Gen<Int>.int(in: Int.min...Int.max)
    }
}
