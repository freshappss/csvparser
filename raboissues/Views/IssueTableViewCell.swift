//
//  IssueTableViewCell.swift
//  raboissues
//
//  Created by Oktay Curebal on 11/08/2022.
//

import UIKit

class IssueTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var dateOfBirthLbl : UILabel!
    @IBOutlet var issueCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
