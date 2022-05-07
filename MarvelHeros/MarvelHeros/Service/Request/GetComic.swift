//
//  GetComic.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation

public struct GetComic: APIRequest {
    public typealias Response = [Comic]

    // Notice how we create a composed resourceName
    public var resourceName: String {
        return "characters/\(comicId)"
    }

    // Parameters
    private let comicId: Int

    public init(comicId: Int) {
        self.comicId = comicId
    }
}
