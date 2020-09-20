//
//  TitleImageCellViewModel.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import Foundation
import UIKit

struct TitleImageCellViewModel {
    let titleName: String
    let thumbnailImage: String
    let isImageVisible: Bool
    init(with titleName: String, imageName: String) {
        self.titleName = titleName
        self.thumbnailImage = imageName
        if imageName.isValidImageUrl() {
            self.isImageVisible = true
        } else {
            self.isImageVisible = false
        }
    }
}

