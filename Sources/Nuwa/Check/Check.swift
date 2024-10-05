//
//  Created by happyo on 2024/10/05.
//

import Foundation

public func check<A>(_ message: String, using gen: Gen<A>? = nil, _ property: @escaping (A) -> Bool, numberOfTests: Int = 100) where A: Arbitrary {
    let rng = SystemRandomNumberGenerator()
    
    // 使用传入的生成器或默认的 Arbitrary 生成器
    let generator = gen ?? A.arbitrary
    
    for _ in 0..<numberOfTests {
        let (value, _) = generator.sample(using: rng)
        if !property(value) {
            print("Test failed: \(message) on value: \(value)")
            return
        }
    }
    
    print("All tests passed: \(message)")
}
