//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Float: Arbitrary {
    public static var arbitrary: Gen<Float> {
        return Gen<Float>.float(in: Float.leastNormalMagnitude...Float.greatestFiniteMagnitude)
    }
}
