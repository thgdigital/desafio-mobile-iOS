//
//  SectionsProtocol.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 13/05/22.
//

import UIKit

protocol SectionsProtocol: AnyObject {
    var items: [Any] { get set}
    func configureSection() -> NSCollectionLayoutSection
    func willDisplayCell(_ cell: UICollectionViewCell, at indexPath: IndexPath)
    func cell(for indexPath: IndexPath) -> CollectionViewCell.Type
}
