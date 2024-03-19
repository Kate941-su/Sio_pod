//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/07.
//

import Foundation

public class Response {
  // The data of response body
  let data: Data
  let statusCode: StatusCode
  let mimeType: String
  let date: Date?
  let contentLength: Int
  // You can get raw http response data.
  // Now, you can extract statusCode
  // in the header structed by json type
  let respnseHeader: URLResponse

  init(
    data: Data, statusCode: StatusCode, mimeType: String, date: Date? = nil, contentLength: Int,
    responseHeader: URLResponse
  ) {
    self.data = data
    self.statusCode = statusCode
    self.mimeType = mimeType
    self.date = date
    self.contentLength = contentLength
    self.respnseHeader = responseHeader
  }

  /// You can get json data from the following computed property.
  /// If you faild to convert, you will get nil
  public var json: [String: Any]? {
    do {
      if let jsonString = String(data: data, encoding: .utf8) {
        if let jsonData = jsonString.data(using: .utf8),
          let dict = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
        {
          return dict
        }
      }
    } catch {
      print("JSONSerialization Error")
      return nil
    }
    return nil
  }

  public var text: String? {
    if let stringDataUtf8 = String(data: data, encoding: .utf8) {
      return stringDataUtf8
    } else {
      if let stringDataLatin1 = String(data: data, encoding: .isoLatin1) {
        return stringDataLatin1
      }
    }
    return nil
  }

}
