//
//  ComicCollectionCell.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class ComicCollectionCell: UICollectionViewCell {
    lazy var customView = ComicCollectionCellView()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    
    private func setupLayout() {
        addSubviews(views: customView)
        customView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
