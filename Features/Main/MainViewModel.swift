//
//  MainViewModel.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class MainViewModel: BaseViewModel {
    let mainResponder: MainResponder
    let screenTitle = "Swift News"
    let cellIdentifier = "TitleImageTableViewCell"
    var didItemsLoad = Dynamic<Bool>(value: false)
    var numberOfRows: Int {
        return newsFeedArray.count
    }
    var newsFeedArray: [ChildItem] = [] {
        didSet {
            didItemsLoad.value = true
        }
    }
    init(mainResponder: MainResponder) {
        self.mainResponder = mainResponder
        super.init()
    }
    func getCellViewModel(row: Int) -> TitleImageCellViewModel {
        let model = newsFeedArray[row]
        return .init(with: model.data?.title ?? "", imageName: model.data?.thumbnail ?? "")
    }
}
extension MainViewModel {
    func fetchNewsFeed() {
        viewStatus.value = .loading(loadStyle: loadingStyle(), title: loadingTitle(), subtitle: "")
        NewsHandler().getNewsFeed { [weak self] (value, error) in
            self?.viewStatus.value = .loaded
            if let error = error { self?.showAPIError(errorObject: error) }
            else if let value = value {
                self?.handleNewsFeedResponse(model: value)
            }
        }
    }
    private func handleNewsFeedResponse(model: SwiftNews) {
        guard model.data != nil else { return }
        guard (model.data?.children) != nil else { return }
        guard model.data?.children?.count != 0 else { return }
        newsFeedArray.removeAll()
        newsFeedArray.append(contentsOf: model.data?.children ?? [])
    }
}
extension MainViewModel {
    func navigateToDetailScreen(row: Int) {
        let model = newsFeedArray[row]
        mainResponder.showDetailSCreen(with: model)
    }
}
