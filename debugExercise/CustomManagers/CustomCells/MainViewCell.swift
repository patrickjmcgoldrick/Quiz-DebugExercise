//
//  MainViewCell.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

    let mainImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    let nameHeaderLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(mainImageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 2).isActive = true
        
        mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 200).isActive = true
        
        mainImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameHeaderLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameHeaderLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 5).isActive = true
        nameHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 50).isActive = true
        nameHeaderLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }

}
