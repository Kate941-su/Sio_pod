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
    dateFormatter.dateFormat = 
  }
  static public var shared = DateFormatterWrapper()
}

