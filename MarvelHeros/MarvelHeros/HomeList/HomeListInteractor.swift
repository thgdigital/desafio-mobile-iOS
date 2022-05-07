//
//  HomeListInteractor.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation

protocol HomeListInteracting: AnyObject {
    func loadService()
}

protocol HomeListInteractorOutput: AnyObject {
    
}

class HomeListInteractor: HomeListInteracting {
    weak var output:HomeListInteractorOutput?
    
    func loadService() {
        print("carregar os dados")
    }
}
