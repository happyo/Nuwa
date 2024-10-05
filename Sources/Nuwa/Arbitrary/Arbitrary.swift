//
//  Created by happyo on 2024/10/05.
//

import Foundation

public protocol Arbitrary {
    static var arbitrary: Gen<Self> { get }
    
    // 用于生成任意值的默认实现
    static func generate() -> Self
}

public extension Arbitrary {
    static func generate() -> Self {
        let rng = SystemRandomNumberGenerator()
        let (value, _) = arbitrary.sample(using: rng)
        return value
    }
}

