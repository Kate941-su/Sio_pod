//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public enum MimeType: String {
  case form_data = "application/x-www-form-urlencoded"
  case octet_stream = "application/octet-stream"
  case xml = "application/xml"
  case json = "application/json"
  case html = "text/html"
  case plain_text = "text/plain"
  case multipart = "multipart/form-data"

  static public func normilizeMimeType(mimeTypeString: String) -> MimeType? {
    switch mimeTypeString {
    case form_data.rawValue:
      return .form_data
    case octet_stream.rawValue:
      return .octet_stream
    case xml.rawValue:
      return .xml
    case json.rawValue:
      return .json
    case html.rawValue:
      return .html
    case plain_text.rawValue:
      return .plain_text
    case multipart.rawValue:
      return .multipart
    default:
      return nil
    }
  }
}
