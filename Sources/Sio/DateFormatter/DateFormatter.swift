//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/17.
//

import Foundation

class DateFormatterWrapper {
  static var dateFormatter = DateFormatter()
  
  private init() {
    DateFormatterWrapper.dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    DateFormatterWrapper.dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    DateFormatterWrapper.dateFormatter.dateFormat = String.DateFormatType.httpHeader.stringFormat
  }
}


