//
//  Formatters.swift
//  raboissues
//
//  Created by Oktay Curebal on 12/08/2022.
//

import Foundation

class Formatters {
    /// Format string date to dateformat
    /// - Parameter stringDate: the string date
    /// - Returns: return string with desired dateformat
    static func parseStringDateToDate(stringDate: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM yyyy"

        if let date = dateFormatterGet.date(from: stringDate) {
            return dateFormatterPrint.string(from: date)
        } else {
           return ""
        }
    }
}
