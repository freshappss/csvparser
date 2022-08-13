//
//  CSVParserPresenterTests.swift
//  raboissuesTests
//
//  Created by Oktay Curebal on 12/08/2022.
//

import XCTest
@testable import raboissues

class CSVParserPresenterTests: XCTestCase {
    let sut = CSVIssuesInteractor()
    let presenterSpy = CSVParserPresenterSpy()
    
    func getCSVtext(fileName: String) -> String {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "csv"),
            let text = try? String(contentsOf: url, encoding: .utf8) else {
            return ""
        }
        
        return text
    }

    func test_GivenAppIsLoaded_WhenFileIsLoaded_ThenPresentCSVEntriesIsCalled() throws {
        //GIVEN
        sut.presenter = presenterSpy
        
        getCSVtext(fileName: "issues").parseIssues { result in
            let response = CSVIssues.LoadIssues.Response(issuesData: result)
            let issue = IssueMock().issue
            
            //WHEN
            sut.presenter?.presentCSVEntries(response: response)
            
            //THEN
            XCTAssertEqual(presenterSpy.issue, issue)
        }

    }
}

class CSVParserPresenterSpy: CSVParserPresentationLogic {
    var view: CSVParserDisplayLogic?
    var issue: Issue?
    var presentCSVEntriesCalled = false
    func presentCSVEntries(response: CSVIssues.LoadIssues.Response) {
        issue = response.issuesData[0]
        presentCSVEntriesCalled = true
    }
}
