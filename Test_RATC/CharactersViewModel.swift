//
//  CharactersViewModel.swift
//  Test_RATC
//
//  Created by Raúl Torres on 04/02/20.
//  Copyright © 2020 Raúl Torres. All rights reserved.
//

import Foundation

class CharactersViewModel {
    
    var items: [CharacterData] = []
    let characterName: String
    let characterImageUrl: String
    let characterDescription: String
    
    init(character: CharacterData) {
        self.characterName = character.name
        let thumbnail = character.thumbnail
        self.characterImageUrl = thumbnail.path + (thumbnail.thumbnailExtension ?? "jpg")
        self.characterDescription = character.resultDescription.isEmpty ? "No description" : character.resultDescription
    }
    
    func fetchData() {
        
    }
}
