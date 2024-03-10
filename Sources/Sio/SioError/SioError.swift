//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public class SioError: Error {
  let message: String
  let responseCode: ResponseCode?
  let body: Any?
  
  private init(message: String, responseCode: ResponseCode? = nil, body: Any? = nil){
    self.message = message
    self.responseCode = responseCode
    self.body = body
  }
  
  static public var inValidUrl: SioError {
   return SioError(
    message: "Invalid URL")
  }
  
  static public var unknown: SioError {
    return SioError(
     message: "Unknown Error")
  }

  static public var debugging: SioError {
    return SioError(
     message: "Only For Debugging")
  }
  
}
