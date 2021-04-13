//
//  DateFormatters.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/12/21.
//

import Foundation

extension DateFormatter {
    
    static let iso8601WithoutTimezone: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    static let dateTimeForDisplay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
}
