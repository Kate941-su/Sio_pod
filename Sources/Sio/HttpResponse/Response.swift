//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/07.
//

import Foundation

public class Response {
  let data: Any
  let statusCode: StatusCode
  let responseType: ResponseType
  let date: Date
  let contentLength: Int

  init(
    data: Any, statusCode: StatusCode, responseType: ResponseType, date: Date, contentLength: Int
  ) {
    self.data = data
    self.statusCode = statusCode
    self.responseType = responseType
    self.date = date
    self.contentLength = contentLength
  }
}
