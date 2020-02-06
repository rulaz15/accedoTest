//
//  Event.swift
//  Test_RATC
//
//  Created by Raúl Torres on 05/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import Foundation

class Event {
    
    private var observer: (() -> Void)?
    private var queue: DispatchQueue = DispatchQueue.main
    
    func subscribe(q: DispatchQueue, observer: @escaping (() -> Void)) {
        self.queue = q
        self.observer = observer
    }
    
    func subscribe(observer: @escaping (() -> Void)) {
        self.observer = observer
    }
    
    func emit() {
        queue.async { [weak self] in
            self?.observer?()
        }
        
    }
    
}
