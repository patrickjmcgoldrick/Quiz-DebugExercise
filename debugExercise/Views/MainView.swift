//
//  MainView.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

extension MainView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainViewCell()
        cell.nameHeaderLabel.text = arrayOfCast?[indexPath.section].text.split(separator: "-").first?.description
        let urlString = ((arrayOfCast?[indexPath.row].icon.url.isEmpty)! ? arrayOfCast?[indexPath.row].icon.url : "https:/loremflickr.com/640/360")!
        cell.mainImageView.downloadImageFrom(link: urlString, contentMode: .scaleAspectFit)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.castObject = nil//arrayOfCast?[indexPath.row]
        controller?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

class MainView: UIView {
    
    var mainTableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()

    var arrayOfCast: [Cast]?
    
    weak var controller: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(mainTableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        mainTableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = false
        mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
