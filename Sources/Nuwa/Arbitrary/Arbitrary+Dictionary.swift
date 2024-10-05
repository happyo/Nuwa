//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Dictionary: Arbitrary where Key: Arbitrary & Hashable, Value: Arbitrary {
    public static var arbitrary: Gen<Dictionary<Key, Value>> {
        return Gen<Dictionary<Key, Value>>.dictionary(keyGen: Key.arbitrary, valueGen: Value.arbitrary, count: 10)
    }
}
