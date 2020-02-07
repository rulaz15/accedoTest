//
//  UICollectionView+Extension.swift
//  Test_RATC
//
//  Created by Raúl Torres on 06/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func addEmptyView() {
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .white
        containerView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        let emptyView = EmptyView()
        containerView.addSubview(emptyView)
        emptyView.fillSuperview()
        backgroundView = containerView
    }
    
    func restore() {
        backgroundView = nil
    }
}
