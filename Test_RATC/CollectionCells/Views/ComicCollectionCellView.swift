//
//  ComicCollectionCellView.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class ComicCollectionCellView: UIView {
    
    public lazy var comicImageView: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        i.image = #imageLiteral(resourceName: "big-hero-6")
        i.clipsToBounds = true
        return i
    }()
    
    public lazy var comicNameLabel: UILabel = {
       let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.textAlignment = .center
        l.minimumScaleFactor = 0.5
        l.numberOfLines = 0
        return l
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubviews(views: comicImageView, comicNameLabel)
        comicImageView.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor
        )
        
        comicNameLabel.anchor(
            top: comicImageView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
            size: .init(width: 0, height: 80)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
