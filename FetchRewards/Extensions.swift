//
//  Extensions.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/12/21.
//

import Foundation

extension DateFormatter {
  static let iso8601WithoutTimezone: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//    formatter.calendar = Calendar(identifier: .iso8601)
//    formatter.timeZone = TimeZone(secondsFromGMT: 0)
//    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
