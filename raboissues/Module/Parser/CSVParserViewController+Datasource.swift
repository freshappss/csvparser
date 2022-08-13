//
//  CSVParserViewController+Datasource.swift
//  raboissues
//
//  Created by Oktay Curebal on 11/08/2022.
//

import Foundation
import UIKit

extension CSVParserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "IssueCell",
            for: indexPath
        ) as? IssueTableViewCell else {
            return UITableViewCell()
        }
        
        let issue = issues[indexPath.row]
        
        cell.nameLbl.text = "\(issue.firstName) \(issue.surName)"
        cell.issueCount.text = issue.issueCount
        cell.dateOfBirthLbl.text = issue.dateOfBirth
        
        return cell
    }
}
