//
//  CustomCollectionFlow.swift
//  Test_RATC
//
//  Created by Raúl Torres on 03/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class CustomCollectionFlow: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.minimumLineSpacing = 16.0
        self.minimumInteritemSpacing = 16.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
