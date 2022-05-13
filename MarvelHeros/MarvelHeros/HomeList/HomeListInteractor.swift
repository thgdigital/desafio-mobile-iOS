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
    func loadEntity(enteties: [ComicCharacterEntenty])
}

class HomeListInteractor: HomeListInteracting {
    var total: Int
    var offset: Int = 0
    var count: Int  = 0
    var limit: Int = 20
    var name: String? = nil
    
    let manager: ManagerRequest
    
    weak var output: HomeListInteractorOutput?
    
    init(manager: ManagerRequest, total: Int) {
        self.manager = manager
        self.total = total
    }
    
    func loadService() {
        manager.getCharacters(GetCharacters(name: name, limit: limit, offset: offset)) { [weak self] result in
            switch result {
            case let .success(data):
                self?.limit = data.limit
                self?.offset = data.offset
                self?.total = data.total
                self?.output?.loadEntity(enteties: data.results.map({ ComicCharacterEntenty(model: $0)}))
            case let .failure(error):
                print(error)
            }
        }
    }
}
