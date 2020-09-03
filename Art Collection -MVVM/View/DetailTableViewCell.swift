//
//  DetailTableViewCell.swift
//  Art Collection -MVC
//
//  Created by Dayton on 03/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var techLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var moreInfoTextView: UITextView!
    
    var detailViewModel: ArtObject! {
        didSet{
            titleLabel.text = "\(detailViewModel.getTitle) (\(detailViewModel.getDate))"
            techLabel.text = detailViewModel.getTechnique
            descLabel.text = detailViewModel.getDescription
            
            if let url = detailViewModel.getImagesUrl{
                artImageView.sd_setImage(with: url)
                
        
            }
            
            titleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
            titleLabel.textAlignment = .center
            moreInfoTextView.textColor = UIColor(white: 114 / 255, alpha: 1)
            
            moreInfoTextView.text = detailViewModel.expandedTable
            moreInfoTextView.textAlignment = detailViewModel.isExpanded ? .left : .center
            
            titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
            moreInfoTextView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        }
    }
    
}
