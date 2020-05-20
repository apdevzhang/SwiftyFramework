//
//  SwiftyFramework
//
//  Created by BANYAN on 2020/1/7.
//  Copyright © 2020 BANYAN. All rights reserved.
//

import Moya

public let networkActivityPlugin = NetworkActivityPlugin { (change,_)  -> () in
    switch(change){
    case .ended:
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    case .began:
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
}

