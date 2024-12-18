//
//  ServiceFactory.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import Foundation

struct ServiceFactory {
    
    func catsService() -> CatsService {
        return CatsNetworkService()
    }
    
    func catsMockService() -> CatsService {
        return CatsMockService()
    }
}
