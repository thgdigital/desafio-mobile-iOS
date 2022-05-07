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
    let total: Int
    var offset: Int = 0
    var count: Int  = 0
    var limit: Int = 20
    var name: String? = nil
    
    let manager: MarvelManager
    
    weak var output:HomeListInteractorOutput?
    
    init(manager: MarvelManager, total: Int) {
        self.manager = manager
        self.total = total
    }
    
    func loadService() {
        manager.getCharacters(GetCharacters(name: name, limit: limit, offset: offset)) { [weak self] result in
            switch result {
            case let .success(data):
                print(data)
            case let .failure(error):
                print(error)
            }
        }
    }
}
