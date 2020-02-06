//
//  ActivityIndicatorView.swift
//  Test_RATC
//
//  Created by Raúl Torres on 05/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    lazy var loaderView: UIView = {
        let v = UIView(frame: .zero)
        v.clipsToBounds = true
        v.layer.cornerRadius = 4
        v.backgroundColor = .white
        return v
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let a = UIActivityIndicatorView(style: .gray)
        return a
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupLayout() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        loaderView.addSubview(activityIndicator)
        self.addSubview(loaderView)
        
        loaderView.centerInSuperview(size: .init(width: 48, height: 48))
        activityIndicator.centerInSuperview(size: .init(width: 32, height: 32))
        activityIndicator.startAnimating()
        
    }
}
