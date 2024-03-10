//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public protocol OptionProtcol {
  var baseURI: URL? {get set}
  var path: String? {get set}
  var data: Any? {get set}
  var queryParameters: [String: Any]? {get set}
  var requestHeader: RequestHeader? {get set}
  var responseType: ResponseType? {get set}
  var cancelToken: CancelToken? {get set}
  var requestMethod: RequestMethod? {get set}
  var mimeType: MimeType? {get set}
  var timeout: Double? {get set}
}
