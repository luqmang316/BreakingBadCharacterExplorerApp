//
//  BreakingBadCharacterViewModel.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

class BreakingBadCharacterViewModel: NSObject {
    
    public var data = [BreakingBadCharactersCellViewModel]()
    public var dataSource = [BreakingBadCharactersCellViewModel]()
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func fetchData(completion:@escaping () -> Void) {
        
        fetchResults(completion: completion)
    }
    
    func filterResult(searchText: String){
        if searchText.count > 0 ,let integerToSearch = Int(searchText){
            dataSource = data.filter({ (obj) -> Bool in
                if let appearence = obj.appearance  {
                    return appearence.contains(integerToSearch) ? true:false
                }
                else{
                    return false
                }
            })
        }
        else if searchText.count > 0 {
            dataSource=data.filter { ($0.name?.lowercased().contains(searchText.lowercased()) ?? false) }
            
        }
        else{
            dataSource = data
        }
        self.dataUpdated?()
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        
        SearchService().request() {[weak self] (result) in
            guard let self = self else {return}
            GCD.runOnMainThread {
                
                switch result {
                case .Success(let results):
                    if let result = results {
                        self.data = result.map{
                            BreakingBadCharactersCellViewModel(result: $0)
                        }
                        self.dataSource = self.data
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
