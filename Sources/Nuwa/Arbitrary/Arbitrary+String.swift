//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension String: Arbitrary {
    public static var arbitrary: Gen<String> {
        return Gen<String>.string(range: 3...10)
    }
}
