//
//  UIImage.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:"")! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.sync {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
