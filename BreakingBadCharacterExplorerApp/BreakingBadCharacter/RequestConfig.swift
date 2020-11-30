//
//  RequestConfig.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

enum RequestConfig {
    
    case searchRequest(String)
    
    var value: Request? {
        switch self {
        case .searchRequest(_):
            let reqConfig = Request.init(requestMethod: .get, urlString: Constants.searchURL)
            return reqConfig
        }
    }
}
