//
//  SearchResults.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

struct SearchResults: Decodable {
    
    let char_id: Int?
    let name: String?
    var birthday: String?
    var occupation: [String?]?
    var img: String?
    var status: String?
    var nickname: String?
    var appearance: [Int?]?
    var portrayed: String?
    var category: String?
    var better_call_saul_appearance: [Int?]?
    
}
