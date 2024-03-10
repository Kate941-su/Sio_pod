// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let mocked_get_json_url = "http://127.0.0.1:8000/api/healthChecker"

let mocked_get_404_url = "http://127.0.0.1:8000/api/healthCheckers"

@available(iOS 13.0, macOS 12.0, *)
public struct Sio: SioRepository {
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

  public func get(
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

  public func getUri(
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
    requestMethod: RequestMethod?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  func encodeRequest(options: OptionProtcol, requestMethod: RequestMethod?) throws -> URLRequest {
    guard let baseUri = options.baseURI else {
      throw SioError.inValidUrl()
    }

    let uri = connectUri(baseUri: baseUri, path: options.path ?? "")

    /// The simplest usage
    var request = URLRequest(url: uri)

    if let timeout = options.timeout {
      request.timeoutInterval = timeout
    }

    /// Handling Request Method
    if let requestMethod = requestMethod {
      switch requestMethod {
      case .GET:
        request.httpMethod = RequestMethod.GET.rawValue
      case .POST:
        request.httpMethod = RequestMethod.POST.rawValue
      case .PUT:
        request.httpMethod = RequestMethod.PUT.rawValue
      }
    } else {
      request.httpMethod = RequestMethod.GET.rawValue
    }

    /// Handling Request Body
    if let data = options.data {
      request.httpBody = data
    }

    /// Handling Request HTTP Header
    if let requestHeaders = options.requestHeader {
      for requestHeader in requestHeaders {
        request.setValue(requestHeader.headerValue, forHTTPHeaderField: requestHeader.headerField)
      }
    }

    /// Handling Request Query Parameters
    if let queryParameters = options.queryParameters {
      var urlComponetns = URLComponents(string: uri.absoluteString)!
      var res: [URLQueryItem] = []
      for (key, value) in queryParameters {
        res.append(URLQueryItem(name: key, value: value as? String))
      }
      urlComponetns.queryItems = res
      request.url = urlComponetns.url
    }
    return request
  }

  func decodeResponse(options: OptionProtcol, data: Data, response: URLResponse) throws -> Response
  {
    let contentLength = response.expectedContentLength
    guard let mimeTypeString = response.mimeType,
          let mimeType = MimeType.normilizeMimeType(mimeTypeString: mimeTypeString) else {
      throw SioError.unknownMimeType(mimeTypeString: response.mimeType ?? "Unknown")
    }

    guard let httpURLResponse: HTTPURLResponse = response as? HTTPURLResponse else {
      throw SioError.decodeError()
    }

    guard
      let statusCode: StatusCode = StatusCode.normalizeStatusCode(
        statusCode: httpURLResponse.statusCode)
    else {
      throw SioError.unknownStatusCode(statusCode: httpURLResponse.statusCode)
    }
    guard let stringDate = httpURLResponse.allHeaderFields["Date"] as? String,
          let date = DateFormatterWrapper.shared.dateFormatter.date(from: stringDate) else {
      throw SioError.stringDateFormatError()
    }
    return Response(
      data: data,
      statusCode: statusCode,
      mimeType: mimeType,
      date: date,
      contentLength: Int(contentLength))
  }

  // @forTesting
  public func mockedRequestByPath(options: OptionProtcol, requestMethod: RequestMethod) async throws
    -> Response
  {
    guard let baseUri = options.baseURI else {
      throw SioError.inValidUrl()
    }
    // http://localhost/ + /path/to/source
    let uri = connectUri(baseUri: baseUri, path: options.path ?? "")

    Util.debugPrint(title: "URL") {
      print("URL: \(uri)")
    }

    Util.debugPrint(title: "Print Options") {
      print("options.baseURI: \(String(describing: options.baseURI))")
      print("options.path: \(String(describing: options.path))")
      print("options.query: \(String(describing: options.queryParameters))")
      print("options.mimeType: \(String(describing: options.mimeType))")
      print("options.requestHeader: \(String(describing: options.requestHeader))")
      print("options.timeout: \(String(describing: options.timeout))")
    }

    do {
      let request = try encodeRequest(options: options, requestMethod: requestMethod)
      let (data, response) = try await session.data(for: request)

      Util.debugPrint(title: "Response Data") {
        print("Data: \(data)")
      }

      Util.debugPrint(title: "Response Header") {
        print("Response \(response)")
      }
        guard let mimeTypeString = response.mimeType,
              let mimeType = MimeType.normilizeMimeType(mimeTypeString: mimeTypeString) else {
          throw SioError.unknownMimeType(mimeTypeString: response.mimeType ?? "Unknown")
        }
        
        return Response(
          data: data as Data,
          statusCode: .ok,
          mimeType: mimeType,
          date: Date(),  // TODO: Parse for valid format
          contentLength: 0)  // TODO: Parse for valid format

    } catch {
      Util.debugPrint(title: "Print Options") {
        print("Error Response is \(error)")
      }
      throw SioError.debugging()
    }
  }

  public func mockedRequestByUri(options: OptionProtcol) async {

  }
}
