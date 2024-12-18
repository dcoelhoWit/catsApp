//
//  CatsAppTests.swift
//  CatsAppTests
//
//  Created by Diogo Coelho on 15/12/2024.
//

import XCTest
@testable import CatsApp

final class CatsAppTests: XCTestCase {
    
    private let serviceFactory = ServiceFactory()
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testCatsListParseSuccess() async throws {
        let service = serviceFactory.catsMockService()
        let cats: [CatEntryModel] = try await service.loadCatsList(limit: 100, page: 0)
        
        XCTAssertNotNil(cats)
    }
    
    func testCatsListModelConversionSuccess() async throws {
        let service = serviceFactory.catsMockService()
        let models: [CatEntryModel] = try await service.loadCatsList(limit: 100, page: 0)
        let viewModels: [CatViewModel] = ConversionUtils.catsListConversion(models: models)
        
        XCTAssertNotNil(viewModels)
        XCTAssertEqual(viewModels.count, models.count)
    }
}
