//
//  HomeViewController.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    let presenter: HomeListPresenting
    
    init(presenter: HomeListPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.loadScreen()
    }

}

extension HomeViewController: HomeDisplaying {
    
}
