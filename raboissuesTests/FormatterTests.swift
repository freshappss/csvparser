//
//  FormatterTests.swift
//  raboissuesTests
//
//  Created by Oktay Curebal on 12/08/2022.
//

import XCTest
@testable import raboissues

class FormatterTests: XCTestCase {
    func test_GivenStringDate_WhenDateFormatted_ThenCorrectStringDateReturned() {
        //GIVEN
        let stringDate = "1970-01-02T00:00:00"
        
        //WHEN
        let formattedDate = Formatters.parseStringDateToDate(
            stringDate: stringDate
        )
        
        //THEN
        XCTAssertEqual(formattedDate, "02 januari 1970")
    }
    
    func test_GivenStringDate_WhenWrongDateFormatted_ThenReturnEmptyDate() {
        //GIVEN
        let stringDate = "1970-13-01T00:00:00"
        
        //WHEN
        let formattedDate = Formatters.parseStringDateToDate(
            stringDate: stringDate
        )
        
        //THEN
        XCTAssertEqual(formattedDate, "")
    }
    
}
