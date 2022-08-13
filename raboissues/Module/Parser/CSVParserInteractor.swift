//
//  CSVParserInteractor.swift
//  raboissues
//
//  Created by Oktay Curebal on 11/08/2022.
//

import Foundation

protocol CSVIssuesBusinessLogic {
    var presenter: CSVParserPresentationLogic? { get set }
    func parseCSVEntries(fileUrl: URL)
}

class CSVIssuesInteractor {
    var presenter: CSVParserPresentationLogic?
}

extension CSVIssuesInteractor: CSVIssuesBusinessLogic {
    
    /// Parse the CSV entries
    /// - Parameter fileUrl: the file url
    func parseCSVEntries(fileUrl: URL) {
        guard let text = try? String(contentsOf: fileUrl, encoding: .utf8) else {
            return
        }
        
        //Parse the CSV entries in background
        DispatchQueue.global(qos: .userInitiated).async {
            text.parseIssues { result in
                let response = CSVIssues.LoadIssues.Response(
                    issuesData: result
                )
                DispatchQueue.main.async {
                    self.presenter?.presentCSVEntries(
                        response: response
                    )
                }
            }
        }
    }
}
