//
//  ReusableIdentifier.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 12/05/22.
//

import Foundation

protocol Identifier{}

extension Identifier where Self: NSObject{
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifier {}
