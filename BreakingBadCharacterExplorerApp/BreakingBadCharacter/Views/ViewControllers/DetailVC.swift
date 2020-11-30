//
//  DetailVC.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/30/20.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var nickNameLbl: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var statusLbl: UILabel!
    @IBOutlet var occupationLbl: UILabel!
    @IBOutlet var seasonAppearanceLbl: UILabel!
    
    // MARK: - Property
    public var detailViewModel: DetailViewModel?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let vm = self.detailViewModel else {
            return
        }
        
        // Set data on view..
        self.title = vm.name
        self.statusLbl.text = vm.status
        self.nickNameLbl.text = vm.nickname
        
        imageView.image = UIImage(systemName: "photo")
        imageView.downloadImage(vm.image)
        if vm.occupation.count != 0{
            self.occupationLbl.isHidden = false
            self.occupationLbl.text = vm.occupation
        }
        
        if vm.seasonAppearance.count != 0{
            self.seasonAppearanceLbl.isHidden = false
            self.seasonAppearanceLbl.text = vm.seasonAppearance
        }
    }
    
}
