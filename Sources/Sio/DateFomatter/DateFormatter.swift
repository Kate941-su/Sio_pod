//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/10.
//

import Foundation

public struct DateFormatterWrapper {
  public private(set) var dateFormatter = DateFormatter()
  private init() {
    dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
  }
  static public var shared = DateFormatterWrapper()
}

