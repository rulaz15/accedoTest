//
//  BaseViewController.swift
//  Test_RATC
//
//  Created by Raúl Torres on 05/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loadingView: ActivityIndicatorView?
        
    private func showLoadingView() {
        loadingView = ActivityIndicatorView(frame: UIScreen.main.bounds)
            
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(loadingView!)
        loadingView?.fillSuperview()
    }
    
    private func hideLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    func loaderObserver(_ observable: Observable<Bool>) {
        observable.observe { (isLoading) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
            if isLoading {
                self.showLoadingView()
            } else {
                self.hideLoadingView()
            }
        }
    }
}
 
