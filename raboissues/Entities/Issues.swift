//
//  Issues.swift
//  raboissues
//
//  Created by Oktay Curebal on 10/08/2022.
//

import Foundation

struct Issue: Equatable {
    var firstName: String
    var surName: String
    var issueCount: String
    var dateOfBirth: String
}

enum CSVIssues {
    enum LoadIssues {
        struct Request {}
        struct Response {
            var issuesData: [Issue]
        }
        struct ViewModel {
            var issues: [Issue]
        }
    }
}
