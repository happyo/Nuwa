//
//  Created by happyo on 2024/10/05.
//

import Foundation

extension Character: Arbitrary {
    public static var arbitrary: Gen<Character> {
        return Gen<Character>.char()
    }
}
