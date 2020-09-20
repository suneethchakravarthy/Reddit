//
//  MainViewController.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var mainTableView: UITableView!
    // MARK: - Parameters
    var viewModel: MainViewModel? {
        didSet {
            configureView(with: viewModel)
            bindViewModel()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = viewModel?.screenTitle
        bindAlertModel()
        let textNib = UINib.init(nibName: "TitleImageTableViewCell", bundle: nil)
        mainTableView.register(textNib, forCellReuseIdentifier: viewModel?.cellIdentifier ?? "")
        viewModel?.fetchNewsFeed()
    }

}
extension MainViewController {
    private func bindViewModel() {
        viewModel?.didItemsLoad.bind{[weak self]  in
            guard $0 else { return }
             DispatchQueue.main.async { [weak self] in
                self?.mainTableView.reloadData()
            }
        }
    }
    private func bindAlertModel() {
        viewModel?.alertModel.bindAndFire({ [weak self] alertModel in
            guard let alertModel = alertModel else { return }
            self?.present(alertModel: alertModel, presentationState: self?.viewModel?.errorAlertPresentation)
        })
    }
}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel?.cellIdentifier ?? "") as? TitleImageTableViewCell
        
        let model = viewModel?.getCellViewModel(row: indexPath.row)
        cell?.cellViewModel = model
        
        if model?.isImageVisible ?? false {
            if let urlObject = URL(string: model?.thumbnailImage ?? "") {
                cell?.titleImageView.loadImageWithUrl(urlObject, placeHolder: Constants.Names.placeholderImageName, completion: { (image) in
                    cell?.titleImageView?.image = image
                })
            }
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.navigateToDetailScreen(row: indexPath.row)
    }
}
