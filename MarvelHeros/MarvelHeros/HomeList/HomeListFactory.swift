//
//  HomeListFactory.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import UIKit

enum HomeListFactory {
    
    static func make(wireframe: HomeListWireframe) -> HomeViewController {
        let interactor = HomeListInteractor()
        let presenter = HomeListPresenter(interactor: interactor, router: wireframe)
        interactor.output = presenter
        let viewController = HomeViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
