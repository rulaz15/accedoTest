//
//  CharacterCollectionCellView.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class CharacterCollectionCellView: UIView {
    
    lazy var characterNameLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        l.textAlignment = .center
        l.numberOfLines = 1
        l.backgroundColor = .lightGray
        return l
    }()
    
    lazy var characterImageView: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.image = #imageLiteral(resourceName: "big-hero-6")
        i.clipsToBounds = true
        return i
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .clear
        addSubviews(views: characterNameLabel, characterImageView)
        
        characterNameLabel.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            size: .init(width: 0, height: 40)
        )
        
        characterImageView.anchor(
            top: characterNameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
            size: .init(width: 0, height: 0)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
