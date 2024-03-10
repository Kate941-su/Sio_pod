//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/10.
//

import Foundation

public struct RequestHeader {
  let headerField: String
  let headerValue: String
  init(headerField: String, headerValue: String) {
    self.headerField = headerField
    self.headerValue = headerValue
  }
}
