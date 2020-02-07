//
//  ComicCollectionCell.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit
import Kingfisher

class ComicCollectionCell: UICollectionViewCell {
    lazy var customView = ComicCollectionCellView()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var comic: ComicData? {
        didSet {
            setupValues()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    override func prepareForReuse() {
        customView.comicImageView.image = nil
    }
    
    private func setupLayout() {
        addSubviews(views: customView)
        customView.fillSuperview()
        customView.comicImageView.kf.indicatorType = .activity
    }
    
    private func setupValues() {
        guard let path = comic?.thumbnail.path, let ext = comic?.thumbnail.thumbnailExtension else { return }
        let url = path + "." + ext
        customView.comicImageView.kf.setImage(with: URL(string: url), placeholder: #imageLiteral(resourceName: "no_image"))
        customView.comicNameLabel.text = comic?.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
