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
        
        detailView.detailImageView.downloadImageFrom(link: (castObject?.icon?.url)!, contentMode: .scaleAspectFill)
        detailView.detailTextLabel.text = castObject?.text.split(separator: "-").last?.description
        view = detailView
 
    }
}
