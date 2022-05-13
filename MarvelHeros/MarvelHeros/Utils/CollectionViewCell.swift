//
//  CollectionViewCell.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 13/05/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    class func cellAt(indexPath: IndexPath, in collectionView: UICollectionView) -> CollectionViewCell? {
        collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CollectionViewCell
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
    
    func setupConstraints() {
        
    }
}
