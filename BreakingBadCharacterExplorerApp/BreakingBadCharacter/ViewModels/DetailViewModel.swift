//
//  DetailViewModel.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/30/20.
//

import Foundation
import UIKit

public class DetailViewModel {
    
    var image: String
    var name: String
    var occupation: String
    var status: String
    var nickname: String
    var seasonAppearance: String
    
    init(data: BreakingBadCharactersCellViewModel) {
        
        self.image = data.img ?? ""
        self.name = data.name ?? ""        
        self.status = "Statu: \(data.status ?? "")"
        self.nickname = "Nickname: \(data.nickname ?? "")"
        
        var occupations = ""
        if let occupation = data.occupation{
            occupations = "Occupation: "
            if occupation.count > 0 {
                for (index ,occupation) in occupation.enumerated() {
                    occupations = "\(occupations) \n    \(index+1). \(occupation ?? "")"
                }
            }
        }
        
        self.occupation = occupations
        
        var seasonAppearances = ""
        if let appearance = data.appearance{
            if appearance.count > 0 {
                for appearance in appearance {
                    seasonAppearances = seasonAppearances.count == 0 ? "Appearance: \(appearance ?? 0)" : "\(seasonAppearances), \(appearance ?? 0)"
                }
            }
        }
        
        self.seasonAppearance = seasonAppearances

        
    }
}
