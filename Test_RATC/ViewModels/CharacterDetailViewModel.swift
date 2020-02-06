//
//  CharacterDetailViewModel.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import UIKit

class CharacterDetailViewModel {
    
    let isLoading: Observable = Observable(initialValue: false)
    let errorObserver: Observable = Observable(initialValue: "")
    let reloadDataEvent: Event = Event()
    
    private let character: CharacterData

    var items: [ComicData] = []
    let characterName: String
    let characterImageUrl: String
    let characterDescription: String
    let characterImageObserver: Observable<UIImage> = Observable(initialValue: #imageLiteral(resourceName: "no_image"))
    
    var count: Int {
        items.count
    }
    
    init(character: CharacterData) {
        self.character = character
        self.characterName = character.name
        let thumbnail = character.thumbnail
        self.characterImageUrl = thumbnail.path + "." + (thumbnail.thumbnailExtension ?? "jpg")
        self.characterDescription = character.resultDescription.isEmpty ? "No description" : character.resultDescription
    }
    
    func fetchData() {
        isLoading.value = true
        ServiceLayer.request(router: Router.characterId(id: character.id)) { [weak self] (result: Result<BaseData<ComicData>, Error>) in
            self?.isLoading.value = false
            switch result {
            case .success(let obejcts) :
                print(obejcts.data.results.count)
                self?.items = obejcts.data.results
                self?.reloadDataEvent.emit()
            case .failure(let e):
                self?.errorObserver.value = e.localizedDescription
            }
        }
    }
    
    func getItem(at indexPath: IndexPath) -> ComicData {
        items[indexPath.row]
    }
}
