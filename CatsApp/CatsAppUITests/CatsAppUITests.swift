//
//  CatsAppUITests.swift
//  CatsAppUITests
//
//  Created by Diogo Coelho on 15/12/2024.
//

import XCTest
@testable import CatsApp

final class CatsAppUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
    }
    
    override func tearDownWithError() throws {
            app = nil
    }
    
    func testNavigationToReadme() {
        let aboutButton = app.buttons["readMeButton"]
        XCTAssertTrue(aboutButton.exists)
        aboutButton.tap()
        let aboutTitle = app.staticTexts["readMeTitle"]
        XCTAssertTrue(aboutTitle.exists)
    }
    
    func testNavigationToDetailsOfFirstCat() {
        let firstCat = app.staticTexts["firstCat"]
        XCTAssertTrue(firstCat.exists)
        firstCat.tap()
        let catDetailsBreedLabel = app.staticTexts["catDetailsBreed"]
        XCTAssertTrue(catDetailsBreedLabel.exists)
    }
}
