//
//  DetailViewModel.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class DetailViewModel: BaseViewModel {
    let screenTitle = "Detail"
    let childItem: ChildItem
    init(childItem: ChildItem) {
        self.childItem = childItem
    }
}
