//
//  raboissuesUITests.swift
//  raboissuesUITests
//
//  Created by Oktay Curebal on 10/08/2022.
//

import XCTest

class raboissuesUITests: XCTestCase {

    func test_GivenWhenUserOpensApp_WhenClicksOnButton_ThenDocumentExplorerOpens() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //load the UIDocumentViewController
        app.buttons["Load file"].tap()
            
        sleep(3)
        
        app.cells["issues, csv"].tap()
        
        sleep(3)
    }
    
    func test_GivenWhenUserOpensApp_WhenClicksOnDocument_ThenCSVFileIsParsedAndVisible() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //load the UIDocumentViewController
        app.buttons["Load file"].tap()
            
        sleep(3)
        
        app.cells["issues, csv"].tap()
        
        sleep(3)
        
        let cell = app.cells.element(boundBy: 0)
        XCTAssertTrue(cell.staticTexts["Theo Jansen"].exists)
    }
}
