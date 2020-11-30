//
//  Result.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

enum Result <T>{
    
    case Success(T)
    case Failure(String)
    case Error(String)
}
