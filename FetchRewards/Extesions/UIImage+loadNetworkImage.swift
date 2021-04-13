//
//  UIImage+loadNetworkImage.swift
//  AccuradioPlayer
//
//  Created by Chad Parker on 4/30/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

extension UIImageView {

    static let cache = NSCache<AnyObject, AnyObject>()

    func loadNetworkImage(url: URL) {
        image = nil

        if let imageFromCache = UIImageView.cache.object(forKey: url.absoluteString as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            if let data = data, let imageToCache = UIImage(data: data) {
                UIImageView.cache.setObject(imageToCache, forKey: url.absoluteString as AnyObject)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "noImage")
                }
            }
        }.resume()
    }
}
