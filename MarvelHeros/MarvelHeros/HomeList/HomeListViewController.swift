//
//  HomeViewController.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    let indentifier: String = "cellId"
    
    var sections = [SectionsProtocol]() {
        didSet {
            collectionView.reloadData()
            collectionView.collectionViewLayout = customLayout(sections: sections)
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: indentifier)
        return collection
    }()
    
    let presenter: HomeListPresenting
    
    init(presenter: HomeListPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.loadScreen()
    }
    
    fileprivate func registerCell(_ section: SectionsProtocol, collectionView: UICollectionView, at indexPath: IndexPath) {
        
        let cellClass = section.cell(for: indexPath)
        collectionView.register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        let identifier = section.cell(for: indexPath).identifier
        
        registerCell(section, collectionView: collectionView, at: indexPath)
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let section = sections[indexPath.section]
        section.willDisplayCell(cell, at: indexPath)
    }
}

extension HomeViewController: HomeDisplaying {
    func reloadSections(sections: [SectionsProtocol]) {
        self.sections = sections
    }
}


extension HomeViewController {
    
    func customLayout(sections: [SectionsProtocol]) -> UICollectionViewCompositionalLayout {
        let section = UICollectionViewCompositionalLayout { sectionIndex, env ->
            NSCollectionLayoutSection? in
            
            let sectionLayout = sections[sectionIndex]
            
            return sectionLayout.configureSection()
        }
        
        return section
    }
}
