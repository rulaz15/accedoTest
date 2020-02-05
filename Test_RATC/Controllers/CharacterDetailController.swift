//
//  CharacterDetailController.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class CharacterDetailController: UIViewController {
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    private let estimatedWidth: CGFloat = 100.0
    private let cellMarginSize: CGFloat = 16.0
    
    var viewModel: CharacterDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupContent()
    }
    
    
    private func setupCollectionView() {
        comicsCollectionView.register(ComicCollectionCell.self, forCellWithReuseIdentifier: ComicCollectionCell.identifier)
        comicsCollectionView.delegate = self
        comicsCollectionView.dataSource = self
        
        if let flow = comicsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.minimumInteritemSpacing = 8
            flow.minimumLineSpacing = 8
        }
    }
    
    private func setupContent() {
        characterLabel.text = "vm.name"
        characterImageView.image = #imageLiteral(resourceName: "big-hero-6")
        descriptionLabel.text = "vm.description"
    }

    deinit {
        print("CHARACTER DETAIL DEINITIALIZED")
    }
}


// MARK: - COLLECTIONVIEW DELEGATE & DATASOURCE
extension CharacterDetailController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let num = Int.random(in: 1...50)
        print(num)
        return min(num, 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionCell.identifier, for: indexPath) as! ComicCollectionCell
//        cell.customView.comicImageView.image = vm.comis[indexPath.row].image
        return cell
    }
}

//MARK: - COLLECTIONVIEW FLOW LAYOUT
extension CharacterDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = calculateWidth()
        return CGSize(width: width, height: width*1.35)
    }
    
    private func calculateWidth() -> CGFloat {
        let estimatedWidth = self.estimatedWidth
        let cellCount = floor(CGFloat(self.view.frame.width) / estimatedWidth)
        
        let margin = cellMarginSize * 2.0
        let width = (self.view.frame.width - cellMarginSize * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}
