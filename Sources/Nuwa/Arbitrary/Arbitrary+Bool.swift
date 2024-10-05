//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Bool: Arbitrary {
    public static var arbitrary: Gen<Bool> {
        return Gen<Bool>.bool()
    }
}
