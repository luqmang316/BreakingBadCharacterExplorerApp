//
//  SearchResultCell.swift
//  BreakingBadCharacterExplorerApp
//
//  Created by Muhammad Luqman on 11/29/20.
//

import UIKit

class BreakingBadCharactersCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    public var viewModel: BreakingBadCharactersCellViewModel!{
        
        didSet{
            
            self.setData()
        }
    }
    
    // MARK: - set UI
    private func setData(){
        
        imageIcon.image = UIImage(named: "placeholder")
        imageIcon.downloadImage(viewModel.img ?? "")
        titleLbl.text = viewModel.name
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
