//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/06.
//

import Foundation

public struct BaseOptions: OptionProtcol {
  public var baseURI: URL?
  public var path: String?
  public var body: Data?
  public var queryParameters: [String: String]?
  public var requestHeader: [RequestHeader]?
  public var responseType: ResponseType?
  public var cancelToken: CancelToken?
  public var mimeType: String?
  public var timeout: Double?
}
