//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public class SioError: Error {
  let message: String
  let statusCode: StatusCode?
  let body: Any?

  private init(message: String, statusCode: StatusCode? = nil, body: Any? = nil) {
    self.message = message
    self.statusCode = statusCode
    self.body = body
  }

  static public func inValidUrl(
    path: URL?
  ) -> SioError {
    return SioError(
      message: "[Invalid URL]: A path of \(String(describing: path)) is invalid.")
  }

  static public func debugging(
    body: Any? = nil
  ) -> SioError {
    return SioError(
      message: "[Debugging] Only For Debugging.",
      body: body
    )
  }

  static public func errorDataHandling(body: Any? = nil) -> SioError {
    return SioError(
      message: "[Error Data Handling] Could not parse data got by URL Session.",
      body: body
    )
  }

  static public func decodeError(body: Any? = nil) -> SioError {
    return SioError(message: "[Decord Error] Could not decode URL Session Response.")
  }

  static public func unknownStatusCode(statusCode: Int) -> SioError {
    return SioError(message: "[Unknow Status Code] Status Code '\(statusCode)' is unknown. Please Implement Imedietely.")
  }

  static public func unknownMimeType(mimeTypeString: String) -> SioError {
    return SioError(message: "[Unknow Mime Type]Mime Type '\(mimeTypeString)' is unknown. Please Implement Imedietely.")
  }
  
  static public func stringDateFormatError(body: Any? = nil) -> SioError {
    return SioError(message: "[String Date Format Error] Could not format starting based date.")
  }
  
  static public func unknown(
    body: Any? = nil
  ) -> SioError {
    return SioError(
      message: "[UnKnow] Unknown Error.",
      body: body
    )
  }
  
}
