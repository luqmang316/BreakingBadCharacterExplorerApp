//
//  BreakingBadCharactersCellViewModel.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import Foundation

class BreakingBadCharactersCellViewModel {
    
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
    
    init(result: SearchResults) {
        
        self.char_id = result.char_id
        self.name = result.name
        self.birthday = result.birthday
        self.occupation = result.occupation
        self.img = result.img
        self.status = result.status
        self.nickname = result.nickname
        self.appearance = result.appearance
        self.portrayed = result.portrayed
        self.category = result.category
        self.better_call_saul_appearance = result.better_call_saul_appearance
        
    }
    
}
