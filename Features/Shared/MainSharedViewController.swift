//
//  MainSharedViewController.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class MainSharedViewController: UINavigationController {
    var viewModel: MainSharedViewModel! {
        didSet {
            configureView(with: viewModel)
            bindViewModel()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationBar()
    }
    // MARK: - Private Methods
    private func present(_ view: MainView) {
        DispatchQueue.main.async { [weak self] in
            switch view {
            case .main:
                self?.presentMainScreen()
            case .detail(let childItem):
                self?.presentDetailScreen(with: childItem)
            }
        }
    }
}
// MARK: - Screens presentation
extension MainSharedViewController {
    private func bindViewModel() {
        viewModel.mainView.bindAndFire { [weak self] view in
            if let view = view { self?.present(view) }
        }
    }
    private func presentMainScreen() {
        let mainViewController = MainViewController.load(from: .main)
        mainViewController.viewModel = MainViewModel(mainResponder: viewModel)
        pushViewController(mainViewController, animated: true)
    }
    private func presentDetailScreen(with model: ChildItem) {
        let detailViewController = DetailViewController.load(from: .main)
        detailViewController.viewModel = DetailViewModel(childItem: model)
        pushViewController(detailViewController, animated: true)
    }
}
