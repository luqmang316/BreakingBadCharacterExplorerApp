//
//  BreakingBadCharacterViewModel.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

class BreakingBadCharacterViewModel: NSObject {
    
    public var dataSource = [SearchBusinessCellViewModel]()
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func search(completion:@escaping () -> Void) {
        
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        
        SearchService().request() {[weak self] (result) in
            guard let self = self else {return}
            GCD.runOnMainThread {
                
                switch result {
                case .Success(let results):
                    if let result = results {
                        self.dataSource = result.map{
                            SearchBusinessCellViewModel(result: $0)
                        }
                        self.dataUpdated?()
                    }
                    completion()
                case .Failure(let message):
                    self.showAlert?(message)
                    completion()
                case .Error(let error):
                    self.showAlert?(error)
                    completion()
                }
            }
        }
    }
}
