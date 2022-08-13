//
//  raboissuesTests.swift
//  raboissuesTests
//
//  Created by Oktay Curebal on 10/08/2022.
//

import XCTest
@testable import raboissues

class raboissuesTests: XCTestCase {
    
    func getCSVtext(fileName: String) -> String {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "csv"),
            let text = try? String(contentsOf: url, encoding: .utf8) else {
            return ""
        }
        
        return text
    }
    
    func test_givenCSVFile_WhenFileIsRead_ThenResultIsNotNull() throws {
        //GIVEN
        let data = getCSVtext(fileName: "issues")
        
        //WHEN
        data.parseIssues { result in
            //THEN
            XCTAssertNotNil(result)
        }
    }
    
    func test_givenCSVFile_WhenFileIsRead_ThenFirstResultIsCorrect() throws {
        //GIVEN
        let data = getCSVtext(fileName: "issues")
        
        //WHEN
        data.parseIssues { result in
            let first = result[0]
            
            //THEN
            XCTAssert(first.firstName == "Theo")
        }
    }
    
    func test_givenCSVFile_WhenWrongFileNameEntered_ThenResultIsNull() throws {
        //GIVEN
        let data = getCSVtext(fileName: "issueszz")
        
        //WHEN
        data.parseIssues { result in
            //THEN
            XCTAssert(result.count == 0)
        }
    }
    
}
