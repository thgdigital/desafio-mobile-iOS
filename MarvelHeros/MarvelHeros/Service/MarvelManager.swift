//
//  MarvelManager.swift
//  MarvelHeros
//
//  Created by Thiago Vaz on 06/05/22.
//

import Foundation


protocol ManagerRequest: AnyObject {
    
    func getCharacters<T: APIRequest>(_ request: T, completionHandle: @escaping ResultCallback<DataContainer<T.Response>>)
    
    func image<T: APIRequest>(_ request: T, completionHandle: @escaping ResultCallback<DataContainer<T.Response>>)
    
    func getComics<T: APIRequest>(_ request: T, completionHandle: @escaping ResultCallback<DataContainer<T.Response>>)
}

class MarvelManager: ManagerRequest {
    
    let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getCharacters<T: APIRequest>(_ request: T, completionHandle: @escaping ResultCallback<DataContainer<T.Response>>) {
        client.dataTask(request) { response in
            completionHandle(response)
        }
    }
    
    func image<T: APIRequest>(_ request: T, completionHandle: @escaping ResultCallback<DataContainer<T.Response>>) {
        client.dataTask(request) { response in
            completionHandle(response)
        }
    }
    
    func getComics<T: APIRequest>(_ request: T, completionHandle: @escaping ResultCallback<DataContainer<T.Response>>) {
        client.dataTask(request) { response in
            completionHandle(response)
        }
    }
}
