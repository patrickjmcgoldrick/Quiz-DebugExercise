//
//  DetailView.swift
//  debugExercise
//
//  Created by MCS on 12/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    let detailImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailTextLabel: UILabel = {
        var textView = UILabel()
        textView.textColor = .white
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(detailTextLabel)
        setupView()
        setupConstraints()
    }
    
    func setupConstraints() {
        detailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        detailImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2).isActive = true
        
        detailTextLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 10).isActive = true
        detailTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        detailTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        detailTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
