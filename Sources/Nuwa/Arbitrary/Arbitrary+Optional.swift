//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Optional: Arbitrary where Wrapped: Arbitrary {
    public static var arbitrary: Gen<Optional<Wrapped>> {
        return Gen.optional(of: Wrapped.arbitrary)
    }
}
