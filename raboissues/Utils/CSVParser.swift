//
//  CSVParser.swift
//  raboissues
//
//  Created by Oktay Curebal on 10/08/2022.
//

import Foundation

extension String {
    func parseIssues(withCompletionHandler:(_ result: [Issue]) -> Void) {
        var rows : [[String]] = []
        var issues: [Issue] = []
        
        let newlineCharacterSet = CharacterSet.newlines
        let importantCharactersSet = CharacterSet(charactersIn: ",\"").union(newlineCharacterSet)
        
        let scanner = Scanner(string: self)
        scanner.charactersToBeSkipped = nil
        
        while !scanner.isAtEnd {
            var quotes = false
            var rowFinished = false
            var columns: [String] = []
            var currentColumn = ""
            while !rowFinished {
                var tempString : NSString? = nil
                if let characters = scanner.scanUpToCharacters(
                    from: importantCharactersSet
                ) {
                    currentColumn.append(characters)
                }
                
                if scanner.isAtEnd {
                    if currentColumn != "" {
                        columns.append(currentColumn)
                    }
                    rowFinished = true
                } else if scanner.scanCharacters(
                    from: newlineCharacterSet,
                    into: &tempString
                ) {
                    if quotes {
                        //to break the column text add line break
                        currentColumn.append(tempString! as String)
                    } else {
                        // End of row
                        if currentColumn != "" {
                            columns.append(currentColumn)
                        }
                        rowFinished = true
                    }
                } else if scanner.scanString("\"") != nil {
                    if quotes && (scanner.scanString("\"") != nil) {
                        currentColumn.append("\"")
                    } else {
                        quotes = !quotes
                    }
                } else if (scanner.scanString(",") != nil) {
                    if quotes {
                        currentColumn.append(",")
                    } else {
                        // This is a column separating comma
                        columns.append(currentColumn)
                        currentColumn = ""
                        scanner.scanCharacters(
                            from: CharacterSet.whitespaces
                        )
                    }
                }
            }
            if columns.count > 0 {
                rows.append(columns)
            }
        }
        
        //drop the first header information
        let issueEntries = rows.dropFirst()
        
        //convert csv elements to model
        issueEntries.forEach { model in
            let issue = Issue(
                firstName: model[0],
                surName: model[1],
                issueCount: model[2],
                dateOfBirth: model[3]
            )
            issues.append(issue)
        }
        withCompletionHandler(issues)
    }
}
