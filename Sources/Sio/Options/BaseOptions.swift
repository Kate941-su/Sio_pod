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
  public var data: Data?
  public var queryParameters: [String: Any]?
  public var requestHeader: [RequestHeader]?
  public var responseType: ResponseType?
  public var cancelToken: CancelToken?
  public var mimeType: MimeType?
  public var timeout: Double?
}
