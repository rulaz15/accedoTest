//
//  Observable.swift
//  Test_RATC
//
//  Created by Raúl Torres on 05/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import Foundation

class Observable<T> {
    
    var value: T {
        didSet {
            valueChanged()
        }
    }
    var observer: ((_ value: T) -> Void)?
    var queue: DispatchQueue = DispatchQueue.main
    
    init(initialValue: T) {
        self.value = initialValue
    }
    
    func observe(_ observer: @escaping (_ value: T) -> Void) {
        self.observer = observer
    }
    
    fileprivate func valueChanged() {
        queue.async { [weak self] in
            if let v = self?.value {
                self?.observer?(v)
            }
        }
    }
    
}
