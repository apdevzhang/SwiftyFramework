//
//  Created by BANYAN on 2020/2/21.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import UIKit
import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: type(of: self))
    }
}
