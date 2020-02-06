//
//  CharactersViewModel.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import Foundation

class CharactersViewModel {
    
    let isLoading: Observable = Observable(initialValue: false)
    let errorObserver: Observable = Observable(initialValue: "")
    let reloadDataEvent: Event = Event()
    
    var items: [CharacterDetailViewModel] = []
    
    var count: Int {
        items.count
    }
    
    private var offset: Int = 0
    
    func fetchData() {
        isLoading.value = true
        ServiceLayer.request(router: Router.characters(offset: offset)) { [weak self] (result: Result<BaseData<CharacterData>, Error>) in
            self?.isLoading.value = false
            switch result {
            case .success(let objects):
                if self?.offset == 0 {
                    self?.items = objects.data.results.map { CharacterDetailViewModel(character: $0) }
                } else {
                    self?.items.append(contentsOf: objects.data.results.map { CharacterDetailViewModel(character: $0) })
                }
                self?.reloadDataEvent.emit()
                self?.offset += 10
            case .failure(let e):
                self?.errorObserver.value = e.localizedDescription
            }
        }
    }
    
    func getItem(at indexPath: IndexPath) -> CharacterDetailViewModel {
        items[indexPath.row]
    }
    
    func willDisplayItem(at indexPath: IndexPath) {
        if indexPath.row == count-1 && !isLoading.value {
            fetchData()
        }
    }
}
