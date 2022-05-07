//
//  MarvelError.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation

public enum MarvelError: Error {
    case encoding
    case decoding
    case server(message: String)
}
