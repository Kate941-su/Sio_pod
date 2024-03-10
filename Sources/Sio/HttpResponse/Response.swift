//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/07.
//

import Foundation

public class Response {
  let data: Data
  let statusCode: StatusCode
  let mimeType: MimeType
  let date: Date
  let contentLength: Int

  init(
    data: Data, statusCode: StatusCode, mimeType: MimeType, date: Date, contentLength: Int
  ) {
    self.data = data
    self.statusCode = statusCode
    self.mimeType = mimeType
    self.date = date
    self.contentLength = contentLength
  }
}
