//
//  Comic.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation

public struct Comic: Decodable {
    public let id: Int
    public let title: String?
    public let issueNumber: Double?
    public let description: String?
    public let pageCount: Int?
    public let thumbnail: Image?
}
