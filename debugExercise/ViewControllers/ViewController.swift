//
//  ViewController.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .red
        mainView.controller = self
        view = mainView
        
        NetworkManager.shared.getFamilyGuyCharacters(completion: {
            resultArray in
            self.mainView.arrayOfCast = resultArray
            DispatchQueue.main.async {
                self.mainView.mainTableView.reloadData()
            }
            
        })
    }
    
  


}

