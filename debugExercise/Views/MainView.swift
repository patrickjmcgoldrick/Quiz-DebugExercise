//
//  MainView.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public var mainTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
    }()

    var arrayOfCast: [Cast]?
    
    weak var controller: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(mainTableView)
        setupConstraints()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    }
    
    func setupConstraints() {
        mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

// MARK: TableView Data Source
extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCast?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainViewCell()
        
        let cast = arrayOfCast?[indexPath.row]
        cell.nameHeaderLabel.text = cast?.text.split(separator: "-").first?.description
        if let urlString = cast?.icon?.url {
            if !urlString.isEmpty {
                print(urlString)
                cell.mainImageView.downloadImageFrom(link: urlString, contentMode: .scaleAspectFit)
            } else {
                cell.mainImageView.downloadImageFrom(link: "https:/loremflickr.com/100/100", contentMode:  .scaleAspectFit)
            }
        }
        return cell
    }
}


// MARK: TableView Delegate
extension MainView: UITableViewDelegate {
       
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        let detailViewController = DetailViewController()
        detailViewController.castObject = arrayOfCast?[indexPath.row]
        
        controller?.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

