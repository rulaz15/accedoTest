//
//  CharacterCollectionCell.swift
//  Test_RATC
//
//  Created by Raúl Torres on 03/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCollectionCell: UICollectionViewCell {
    
    private lazy var customView = CharacterCollectionCellView()
    
    var vm: CharacterDetailViewModel? {
        didSet {
            setupValues()
        }
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    override func prepareForReuse() {
        customView.characterNameLabel.text = nil
        customView.characterImageView.image = nil
    }
    
    private func setupLayout() {
        addSubviews(views: customView)
        customView.fillSuperview()
        customView.characterImageView.kf.indicatorType = .activity
    }
    
    private func setupValues() {
        guard let item = vm else { return }
        customView.characterNameLabel.text = item.characterName
        customView.characterImageView.kf.setImage(with: URL(string: item.characterImageUrl), placeholder: #imageLiteral(resourceName: "no_image")) { result in
            if case .success(let value) = result {
                self.vm?.characterImageObserver.value = value.image
            }
        }
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
