//
//  HomeListWireframe.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import UIKit

class HomeListWireframe {
    
    func showView() -> UIViewController {
        HomeListFactory.make(wireframe: self)
    }
}
