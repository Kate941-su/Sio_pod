//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/10.
//

import Foundation

public struct MockedSio: SioRepository {
  func get(
    path: String, data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: (any OptionProtcol)?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }

  func getUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: (any OptionProtcol)?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }

  func post(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: (any OptionProtcol)?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }

  func postUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: (any OptionProtcol)?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }

  func download(
    path: String,
    cancelToken: CancelToken?,
    options: (any OptionProtcol)?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> URL? {
    fatalError()
  }

  func downloadUri(
    uri: URL,
    cancelToken: CancelToken?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> URL? {
    fatalError()
  }

  func upload(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: (any OptionProtcol)?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }

  func request(
    uri: URL,
    options: any OptionProtcol,
    requestMethod: RequestMethod,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }

  func encodeRequest(
    uri: URL,
    options: any OptionProtcol,
    requestMethod: RequestMethod?
  ) throws -> URLRequest? {
    fatalError()
  }

  func decodeResponse(
    options: any OptionProtcol,
    data: Data,
    response: URLResponse
  ) -> Response {
    fatalError()
  }

}
