//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/10.
//

import Foundation

protocol SioRepository {
  func get(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response

  func getUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response

  func post(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response

 func postUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response

 func download(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response

  func downloadUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response

  // After v1?
  func upload(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response

  func request(
    options: OptionProtcol,
    requestMethod: RequestMethod?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response

  func encodeRequest(options: OptionProtcol, requestMethod: RequestMethod?) throws -> URLRequest
}
