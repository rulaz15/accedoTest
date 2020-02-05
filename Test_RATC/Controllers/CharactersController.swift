//
//  ViewController.swift
//  Test_RATC
//
//  Created by Raúl Torres on 03/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class CharactersController: UIViewController {

    @IBOutlet weak var charactersCollectionView: UICollectionView!
    
    private let estimatedWidth: CGFloat = 200.0
    private let cellMarginSize: CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        charactersCollectionView.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: CharacterCollectionCell.identifier)
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        
        if let flow = charactersCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.minimumInteritemSpacing = 16
            flow.minimumLineSpacing = 16
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
         //pass selected object
        }
    }
}

// MARK: - COLLECTIONVIEW DELEGATE & DATASOURCE
extension CharactersController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionCell.identifier, for: indexPath) as! CharacterCollectionCell
        cell.customView.characterNameLabel.text = "tessst"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
}

//MARK: - COLLECTIONVIEW FLOW LAYOUT
extension CharactersController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = calculateWidth()
        return CGSize(width: width, height: width*1.5)
    }

    private func calculateWidth() -> CGFloat {
        let estimatedWidth = self.estimatedWidth
        let cellCount = floor(CGFloat(self.view.frame.width) / estimatedWidth)

        let margin = cellMarginSize * 2.0
        let width = (self.view.frame.width - cellMarginSize * (cellCount - 1) - margin) / cellCount

        return width
    }
}
