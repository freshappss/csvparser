//
//  CSVParserPresenter.swift
//  raboissues
//
//  Created by Oktay Curebal on 11/08/2022.
//

import Foundation

protocol CSVParserPresentationLogic {
    var view: CSVParserDisplayLogic? { get set }
    func presentCSVEntries(response: CSVIssues.LoadIssues.Response)
}

class CSVParserPresenter {
    var view: CSVParserDisplayLogic?
}

extension CSVParserPresenter: CSVParserPresentationLogic {
    func presentCSVEntries(
        response: CSVIssues.LoadIssues.Response
    ) {
        var mutedIssues: [Issue] = []
        
        //loop through the issues and format the date
        response.issuesData.forEach { issue in
            var mutedIssue = issue
            mutedIssue.dateOfBirth = Formatters.parseStringDateToDate(
                stringDate: issue.dateOfBirth
            )
            mutedIssues.append(mutedIssue)
        }
        
        //set the ViewModel
        let viewModel = CSVIssues.LoadIssues.ViewModel(
            issues: mutedIssues
        )
        
        //format the dates
        view?.displayCSVEntries(viewModel: viewModel)
    }
}
