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
    body: Any? = nil
  ) -> SioError {
    return SioError(
      message: "Invalid URL",
      body: body
    )
  }

  static public func unknown(
    body: Any? = nil
  ) -> SioError {
    return SioError(
      message: "Unknown Error",
      body: body
    )
  }

  static public func debugging(
    body: Any? = nil
  ) -> SioError {
    return SioError(
      message: "Only For Debugging",
      body: body
    )
  }

  static public func errorDataHandling(body: Any? = nil) -> SioError {
    return SioError(
      message: "Data Parse Missing",
      body: body
    )
  }
}
