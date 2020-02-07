//
//  EmptyView.swift
//  Test_RATC
//
//  Created by Raúl Torres on 06/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    let imageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.image = #imageLiteral(resourceName: "bymax_empty")
        imageVIew.clipsToBounds = true
        imageVIew.backgroundColor = .white
        imageVIew.contentMode = .scaleAspectFit
        imageVIew.backgroundColor = .clear
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        return imageVIew
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "No Data"
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
    }
    
    private func setupLayout() {
        addSubviews(views: imageView, titleLabel)
        
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
//
        titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error init with Coder")
    }
}

