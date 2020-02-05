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
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(comicImageView)
        comicImageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
