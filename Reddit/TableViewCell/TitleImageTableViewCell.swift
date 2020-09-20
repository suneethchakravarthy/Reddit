//
//  TitleImageTableViewCell.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class TitleImageTableViewCell: UITableViewCell {
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    var cellViewModel:TitleImageCellViewModel! {
        didSet {
            titleLabel.text = cellViewModel.titleName
            titleImageView.isHidden = !cellViewModel.isImageVisible
            imageViewHeightConstraint.constant = (titleImageView.isHidden) ? 0.0 : 80.0
        }
    }
}
