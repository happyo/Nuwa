//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Double: Arbitrary {
    public static var arbitrary: Gen<Double> {
        return Gen<Double>.double(in : Double.leastNormalMagnitude...Double.greatestFiniteMagnitude)
    }
}
