//
//  MasterTableViewCell.swift
//  Art Collection -MVC
//
//  Created by Dayton on 01/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import UIKit
import SDWebImage

class MasterTableViewCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
      @IBOutlet weak var titleLabel: UILabel!
      @IBOutlet weak var artistImageView: UIImageView!
      @IBOutlet weak var creationYear: UILabel!
      
    var viewModel: ArtObject! {
        didSet{
            titleLabel.text = "\(viewModel.getTitle) (\(viewModel.getDate))"
            artistLabel.text = viewModel.getCreator
            creationYear.text = viewModel.getTechnique
            
            if let url = viewModel.getImagesUrl{
                self.artistImageView.sd_setImage(with: url)
            }
            
        }
    }
    
}

