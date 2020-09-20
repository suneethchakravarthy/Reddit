//
//  UIImageView+Utils.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageWithUrl(_ url: URL, placeHolder:String?, completion: ((UIImage?) -> Void)? = nil) {
        self.image = UIImage(named: placeHolder ?? "")
        var imageURL: URL?
        imageURL = url
        
        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
                self.image = imageFromCache
                completion?(self.image)
                return
        }
        // else load from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: {
                    if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                            if imageURL == url {
                                self.image = imageToCache
                                completion?(self.image)
                            }
                            imageCache.setObject(imageToCache, forKey: url as AnyObject)
                    }
            })
        }).resume()
    }
}

