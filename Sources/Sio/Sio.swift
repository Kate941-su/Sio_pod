// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let mocked_get_json_url = "http://127.0.0.1:8000/api/healthChecker"

let mocked_get_404_url = "http://127.0.0.1:8000/api/healthCheckers"

@available(iOS 13.0, macOS 12.0, *)
public struct Sio {
  
  let session: URLSession = {
    // If you create not to cache on your device
    // You have to implement configration type would be .ephemeral
    let configration = URLSessionConfiguration.default
    return URLSession(configuration: configration)
  }()

  public var baseOptions: BaseOptions

  public init(options: BaseOptions? = nil) {
    self.baseOptions = options ?? BaseOptions()
  }

  public func get (
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    
    let requestOptions: OptionProtcol = {
      if options != nil {
        return options!
      } else {
        return baseOptions
      }
    }()
    // TODO: implement
    fatalError()
  }
  
  public func getUri (
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func post(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func postUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }
  
  public func download(
    path: String,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func downloadUri(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }
  
  // After v1?
  public func upload(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: OptionProtcol?,
    onSendProgress: ProgressCallback?
  ) async throws -> Response {
    fatalError()
  }
  
  func connectUri(baseUri: URL, path: String) -> URL {
    if #available(iOS 16, macOS 13, *) {
      return baseUri.appending(path: path)
    } else {
      return baseUri.appendingPathComponent(path)
    }
  }
  
  func request(
    options: OptionProtcol,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }
  
  // @forTesting
  public func mockedRequestByPath(options: OptionProtcol) async throws -> Response {
    guard let baseUri = options.baseURI else {
      throw SioError.inValidUrl
    }
    // http://localhost/ + /path/to/source
    let uri = connectUri(baseUri: baseUri, path: options.path ?? "")
    print("=====debug print options======")
    print("options.baseURI: \(String(describing: options.baseURI))")
    print("options.path: \(String(describing: options.path))")
    print("options.query: \(String(describing: options.queryParameters))")
    print("options.uri: \(String(describing: options.mimeType))")
    print("options.uri: \(String(describing: options.requestHeader))")
    print("options.uri: \(String(describing: options.requestMethod))")
    print("options.uri: \(String(describing: options.timeout))")
    print("=============================")
    do {
        let result = try await session.data(from: uri)
        print("Response Result is\(result)")
        return decodeResponse()
    } catch {
      print("Error Response is \(error)")
      throw SioError.debugging
    }
  }
  
  func encodeRequest() {
    
  }
  
  func decodeResponse() -> Response {
    return Response()
  }
  
  
  public func mockedRequestByUri(options: OptionProtcol) async {
    
  }
  
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
