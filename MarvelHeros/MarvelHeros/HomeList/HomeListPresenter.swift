//
//  HomeListPresenter.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation
import UIKit

protocol HomeListPresenting: AnyObject {
    func loadScreen()
}

protocol HomeDisplaying: AnyObject {
    func reloadSections(sections: [SectionsProtocol])
}

class HomeListPresenter: HomeListPresenting {
    let router: HomeListWireframe
    let interactor: HomeListInteracting
    weak var viewController: HomeDisplaying?
    
    init(interactor: HomeListInteracting, router: HomeListWireframe) {
        self.router = router
        self.interactor = interactor
    }
}

extension HomeListPresenter {
    
    func loadScreen() {
        interactor.loadService()
    }
}

extension HomeListPresenter: HomeListInteractorOutput {
    func loadEntity(enteties: [ComicCharacterEntenty]) {
        DispatchQueue.main.async {
        var sections: [SectionsProtocol] = [SectionsProtocol]()
        let itemsSlider = Array(enteties.prefix(upTo: 5))
        let sectionSlider = SectionSlider(items: itemsSlider)
        sections.append(sectionSlider)
        self.viewController?.reloadSections(sections: sections)
        }
    }
}
