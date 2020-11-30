//
//  ImageModel.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

struct ImageModel {
    
    let imageURL: String
    
    init(withPhotos result: SearchResults) {
        imageURL = result.img ?? ""
    }
}
