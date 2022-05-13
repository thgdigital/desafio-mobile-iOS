//
//  ComicCharacterEntenty.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 13/05/22.
//

import Foundation

class ComicCharacterEntenty: NSObject {
    let name: String
    let textDescription: String
    let image: String
    
    init(model: ComicCharacter) {
        self.name = model.name ?? ""
        self.image = model.thumbnail?.url.absoluteString ?? ""
        self.textDescription = model.description ?? ""
    }
}
