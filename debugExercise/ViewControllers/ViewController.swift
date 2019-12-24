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
        
        print ("View Controller")
        
        view.backgroundColor = .red
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailViewController {
            
            guard let indexPath = mainView.mainTableView.indexPathForSelectedRow
                else { return }
            
            guard let cast = mainView.arrayOfCast?[indexPath.row] else { return }
            
            destination.castObject = cast
        }
    }


}

