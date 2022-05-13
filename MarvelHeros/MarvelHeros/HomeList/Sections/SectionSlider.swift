//
//  SectionSlider.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 13/05/22.
//

import UIKit

class SectionSlider: SectionsProtocol {

    var items: [Any] = []
    
    init(items: [Any]) {
        self.items = items
    }
    
    func configureSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 2
        item.contentInsets.leading = 2

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(180))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    func willDisplayCell(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? SliderCell, let dislay = items[indexPath.item] as? ComicCharacterEntenty else {
            return
        }
        
        cell.configure(display: dislay)
    }
    
    
    func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        SliderCell.self
    }
}
