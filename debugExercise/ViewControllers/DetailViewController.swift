//
//  DetailViewController.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    var castObject: Cast?
    
    override func viewDidLoad() {
        if let imageUrl = castObject?.icon?.url {
            if !imageUrl.isEmpty {
                detailView.detailImageView.downloadImageFrom(link: (castObject?.icon?.url)!, contentMode: .scaleAspectFill)
            } else {
                detailView.detailImageView.downloadImageFrom(link: "https:/loremflickr.com/266/200", contentMode:  .scaleAspectFill)
            }
        }
        detailView.detailTextLabel.text = castObject?.text.split(separator: "-").last?.description
        view = detailView
 
    }
}
