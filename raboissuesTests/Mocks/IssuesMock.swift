//
//  IssuesMock.swift
//  raboissuesTests
//
//  Created by Oktay Curebal on 12/08/2022.
//

import Foundation
@testable import raboissues

struct IssueMock: Equatable {
    let issue = Issue(
        firstName: "Theo",
        surName: "Jansen",
        issueCount: "5",
        dateOfBirth: "1978-01-02T00:00:00"
    )
}
