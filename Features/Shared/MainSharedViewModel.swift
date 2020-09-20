//
//  MainSharedViewModel.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

enum MainView {
    case main
    case detail(childItem: ChildItem)
}

class MainSharedViewModel: BaseViewModel {
    let mainView = Dynamic<MainView?>(value: .main)
    init(with mainView: MainView) {
        super.init()
        self.mainView.value = mainView
    }
    private func changeViewState(to view: MainView) {
        mainView.value = view
    }
}

extension MainSharedViewModel: MainResponder {
    func showDetailSCreen(with model: ChildItem) {
        changeViewState(to: .detail(childItem: model))
    }
}
