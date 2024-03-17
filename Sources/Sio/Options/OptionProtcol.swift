//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public protocol OptionProtcol {
  var baseURI: URL? { get set }
  var path: String? { get set }
  var body: Data? { get set }
  var queryParameters: [String: String]? { get set }
  var requestHeader: [RequestHeader]? { get set }
  var responseType: ResponseType? { get set }
  var cancelToken: CancelToken? { get set }
  var mimeType: String? { get set }
  var timeout: Double? { get set }
}
