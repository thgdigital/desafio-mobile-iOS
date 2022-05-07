//
//  HomeListFactory.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import UIKit

enum HomeListFactory {
    
    static func make(wireframe: HomeListWireframe) -> HomeViewController {
        let apiClient =  MarvelApiClient(publicKey: "650e801e1408159969078d2a1361c71c", privateKey: "20112b45612fd05f0d21d80d70bc8c971695c7f1")

        let manager = MarvelManager(client: apiClient)
        let interactor = HomeListInteractor(manager: manager, total: 1559)
        let presenter = HomeListPresenter(interactor: interactor, router: wireframe)
        interactor.output = presenter
        let viewController = HomeViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
}
