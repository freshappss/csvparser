//
//  CSVParserInteractorTests.swift
//  raboissuesTests
//
//  Created by Oktay Curebal on 11/08/2022.
//

import XCTest
@testable import raboissues

class CSVParserInteractorTests: XCTestCase {
    let sut = CSVParserViewController()
    let interactorSpy = CSVParserIteractorSpy()

    func test_GivenAppIsLoaded_WhenFileIsLoaded_ThenParseCSVEntriesIsCalled() throws {
        //GIVEN
        sut.interactor = interactorSpy
        
        //WHEN
        sut.fetchCSVEntries(
            fileUrl: URL(fileURLWithPath: "")
        )
        
        //THEN
        XCTAssertTrue(
            interactorSpy.parseCSVEntriesCalled,
            "parseCSVEntriesCalled() should ask the interactor to load csv file"
        )
    }
}

class CSVParserIteractorSpy: CSVIssuesBusinessLogic {
    var presenter: CSVParserPresentationLogic?
    var parseCSVEntriesCalled = false
    
    func parseCSVEntries(fileUrl: URL) {
        parseCSVEntriesCalled = true
    }
}
