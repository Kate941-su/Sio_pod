// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let mocked_get_json_url = "http://127.0.0.1:8000/api/healthChecker"

let mocked_get_404_url = "http://127.0.0.1:8000/api/healthCheckers"

@available(iOS 13.0, macOS 12.0, *)
public struct Sio: SioRepository {
  let session: URLSession = {
    /// If you create not to cache on your device
    /// You have to implement configration type would be .ephemeral.
    let configration = URLSessionConfiguration.default
    return URLSession(configuration: configration)
  }()

  public var baseOptions: BaseOptions

  public init(options: BaseOptions? = nil) {
    self.baseOptions = options ?? BaseOptions()
  }

  public func get(
    path: String,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil,
    onReceiveProgress: ProgressCallback? = nil
  ) async throws -> Response {
    let baseUri: URL? = options?.baseURI ?? baseOptions.baseURI
    guard let uri = connectUri(baseUri: baseUri, path: path) else {
      throw SioError.inValidUrl(path: URL(string: path)!)
    }
    return try await request(
      uri: uri,
      options: options ?? baseOptions,
      requestMethod: .GET)
  }

  public func getUri(
    uri: URL,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil,
    onReceiveProgress: ProgressCallback? = nil
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func post(
    path: String,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil,
    onReceiveProgress: ProgressCallback? = nil
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func postUri(
    uri: URL,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil,
    onReceiveProgress: ProgressCallback? = nil
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func download(
    path: String,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  public func downloadUri(
    uri: URL,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil
  ) async throws -> Response {
    // TODO: implement
    fatalError()
  }

  // After v1?
  public func upload(
    uri: URL,
    data: Any? = nil,
    queryParameters: [String: Any]? = nil,
    cancelToken: CancelToken? = nil,
    options: OptionProtcol? = nil,
    onSendProgress: ProgressCallback? = nil
  ) async throws -> Response {
    fatalError()
  }

  func connectUri(baseUri: URL?, path: String) -> URL? {
    guard let baseUri else {
      return URL(string: path)
    }
    if #available(iOS 16, macOS 13, *) {
      return baseUri.appending(path: path)
    } else {
      return baseUri.appendingPathComponent(path)
    }
  }

  func request(
    uri: URL,
    options: OptionProtcol,
    requestMethod: RequestMethod,
    onSendProgress: ProgressCallback? = nil,
    onReceiveProgress: ProgressCallback? = nil
  ) async throws -> Response {
      let finalOptions = getFinalOptions(requestOptions: options)
    
      print("You are trying to connect to the URL: \(uri)")
      let request = try encodeRequest(uri: uri, options: finalOptions, requestMethod: requestMethod)
    
      print("You get a response by URL Session.")
      let (data, response) = try await session.data(for: request)

      print("Decode for SioResponse")
      let sioResponse = try decodeResponse(options: finalOptions, data: data, response: response)
      return sioResponse
  }

  func encodeRequest(uri: URL, options: OptionProtcol, requestMethod: RequestMethod?) throws -> URLRequest {
    guard let baseUri = options.baseURI else {
      throw SioError.inValidUrl(path: uri)
    }

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
    
    // TODO: Connect stringDate and date
    guard let stringDate = httpURLResponse.allHeaderFields["Date"] as? String else {
      print("HTTP Header Parse Error")
      throw SioError.stringDateFormatError()
    }
    
    Util.debugPrint(title: "String Date"){
      print("\(stringDate)")
    }
    
    guard let date = stringDate.
    return Response(
      data: data,
      statusCode: statusCode,
      mimeType: mimeType,
      date: date,
      contentLength: Int(contentLength),
      responseHeader: response
    )
  }
  
  /// Option has a priority.
  ///  1. RequestOption
  ///  2. BaseOption
  ///  If RequestOption has a non nil option field, this field would apply RequestOption's filed.
  ///  If the field is nil in RequestOption, the field of BaseOption would apply
  func getFinalOptions(requestOptions: OptionProtcol) -> OptionProtcol {
    return BaseOptions(
      baseURI: requestOptions.baseURI ?? baseOptions.baseURI,
      path: requestOptions.path ?? baseOptions.path,
      data: requestOptions.data ?? baseOptions.data,
      queryParameters: requestOptions.queryParameters ?? baseOptions.queryParameters,
      requestHeader: requestOptions.requestHeader ?? baseOptions.requestHeader,
      responseType: requestOptions.responseType ?? baseOptions.responseType,
      cancelToken: requestOptions.cancelToken ?? requestOptions.cancelToken,
      mimeType: requestOptions.mimeType ?? requestOptions.mimeType,
      timeout: requestOptions.timeout ?? requestOptions.timeout
    )
  }

  
  /// @For Testing
  public func mockedRequestByPath(options: OptionProtcol, requestMethod: RequestMethod) async throws
    -> Response
  {
    guard let baseUri = options.baseURI else {
      throw SioError.inValidUrl(path: nil)
    }
    // http://localhost/ + /path/to/source
    guard let uri = connectUri(baseUri: baseUri, path: options.path ?? "") else {
      throw SioError.inValidUrl(path: nil)
    }

    Util.debugPrint(title: "URL") {
      print("URL: \(String(describing: uri))")
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
      let request = try encodeRequest(uri: uri, options: options, requestMethod: requestMethod)
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
          contentLength: 0,
          responseHeader: response
        )  // TODO: Parse for valid format

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
