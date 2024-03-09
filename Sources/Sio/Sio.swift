// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let mocked_get_json_url = "http://127.0.0.1:8000/api/healthChecker"

let mocked_get_404_url = "http://127.0.0.1:8000/api/healthCheckers"

@available(iOS 13.0, macOS 12.0, *)
public struct Sio {

  public var options = BaseOptions()

  public init(options: BaseOptions) {
    self.options = options
  }

  public func get (
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Result<Response, SioError> {
    // TODO: implement
  }
  
  public func getUri (
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Result<Response, SioError> {
    // TODO: implement
  }

  public func post(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Result<Response, SioError> {
    // TODO: implement
  }

  public func postUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Result<Response, SioError> {
    // TODO: implement
  }
  
  public func download(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?
  ) async throws -> Result<Response, SioError> {
    // TODO: implement
  }
  
  public func downloadUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?
  ) async throws -> Result<Response, SioError> {
    // TODO: implement
  }
  
  func request(
  ) async throws -> Result<Response, SioError> {
    
  }
  
  public func upload() {
    
  }
  
  // @forTesting
  func callGetJsonRequest() async {
    let session: URLSession = {
      let config = URLSessionConfiguration.default
      return URLSession(configuration: config)
    }()
    // TODO: Validation
    let url = URL(string: mocked_get_json_url)!
    let urlRequest = URLRequest(url: url)
    do {
      let result = try await session.data(for: urlRequest)
      print(result)
    } catch {
      print(error)
    }
  }

  // @forTesting
  func callGetJson404Request() async {
    let session: URLSession = {
      let config = URLSessionConfiguration.default
      return URLSession(configuration: config)
    }()
    // TODO: Validation
    let url = URL(string: mocked_get_404_url)!
    let urlRequest = URLRequest(url: url)
    do {
      let result = try await session.data(for: urlRequest)
      print(result)
    } catch {
      print(error)
    }
  }

}
