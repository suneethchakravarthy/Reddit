//
//  DetailViewController.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var articleBody: UILabel!
    
    // MARK: - Parameters
    var viewModel: DetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.navigationBar(with: viewModel?.childItem.data?.title ?? "")
        loadData()
    }
    func loadData() {
        articleBody.text = viewModel?.childItem.data?.title
        if viewModel?.childItem.data?.thumbnail?.isValidImageUrl() ?? false {
            if let urlObject = URL(string: viewModel?.childItem.data?.thumbnail ?? "") {
                thumbnailImageView.loadImageWithUrl(urlObject, placeHolder: Constants.Names.placeholderImageName, completion: { [weak self] (image) in
                    self?.thumbnailImageView.image = image
                })
            }
        } else {
            thumbnailImageView.image = UIImage(named: Constants.Names.placeholderImageName)
        }
    }
}
