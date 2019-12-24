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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let detailTextLabel: UILabel = {
        var textView = UILabel(frame: CGRect(x: 0,
                                             y: UIScreen.main.bounds.height/2,
                                             width: UIScreen.main.bounds.width - 20.0,
                                             height: UIScreen.main.bounds.height/3))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.numberOfLines = 10
        textView.lineBreakMode = .byWordWrapping
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
        addSubview(detailImageView)
        setupConstraints()
    }
    
    func setupConstraints() {
        detailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        detailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        detailImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2).isActive = true
        
        detailTextLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 20).isActive = true
        detailTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        detailTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        detailTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}
