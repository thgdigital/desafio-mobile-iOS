//
//  ComicCharacter.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation

public struct ComicCharacter: Decodable {
    public let id: Int
    public let name: String?
    public let description: String?
    public let thumbnail: Image?
}
