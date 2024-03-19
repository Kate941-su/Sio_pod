# Sio

This library `Sio` is affected by `Dio` which is one of the most common http client library.
`Dio` has a lot of features that are very useful of http connection. Sio picks up some useful
features from `Dio` and implement them as a wrapper of `URLSession`, which library also deal
with http connection,

# Get started

## Install

To add this package, you can get the following step

1. Open Xcode
2. Click `Add Package Dependency...` on the Navigation bar in Mac.
3. Input `https://github.com/Kate941-su/Sio` on the top right serchbar.

Welcome to Sio!

## Examples

### Performing a `GET` request

```swift
var sio = Sio()
/// You can define a base URI. Once you define a baseURI, you can focus
/// on the location path
sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
let response: Response = try await sio.get(path: "api/get/json")
let dict:[String: Any] = response.json
```

### Performing a `POST` request

```swift
var sio = Sio()
let data: [String: Any] = ["name": "Kate941-su", "age" : 26]
sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
let response = try await sio.post(path: "api/post/json", data: data)
```

### Download a file

! This feature only can be used ios 15.0 at least.

```swift
var sio = Sio()
if #available(iOS 15.0, *) {
  var sio = Sio()
  sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000")
  let (filePath, response) = try await sio.download(path: "/api/get/download/video")
}
```

you can put `URI` directly by using `xxxUri()` methods.

```swift
sio.baseOptions.requestHeader = [
  RequestHeader(headerField: "Content-Type", headerValue: "application/json")
]
let response = try await sio.postUri(uri: URL(string: "http://127.0.0.1:8000/api/post/uri/json")!)
```

you also can use `postUri()` and `downloadUri`

# Sio APIs

## Creating an instance and set default config

> If you want to use only one instance, it is recommended to use a singlegon of `Sio` in your project to avoid unknowing error.

`Sio` has a base options.

### Example

```swift
var sio = Sio()
sio.baseOptions.baseUri = "https://api.cocoapods.org"
sio.baseOptions.mimyType = "applicationJson"
sio.baseOptions.queryParameters = ["test1" : "1", "test2" : "2"]
sio.baseOptions.timeout = 5.0
```

you can override `options` when you set a options in the `options` argument.

The priority is

1. The option you set in the http method.
2. The option you set in the sio instance.

! RequestOptions and BaseOptions have same arguments and adopt same protcol.
but in the future, they will have different arguments (RequestOptions will have another arguments). But you can set both of them in the `options` argument.

```swift
var sio = Sio()
let requestOptions: RequestOptions = RequestOptions(timeout: 3.0)
let response: Response = try await sio.get(path: "api/get/json", options: requestOptions)
```

Base http connection of API is:

```swift
  func request(
    uri: URL,
    options: OptionProtcol,
    requestMethod: RequestMethod,
    onSendProgress: ProgressCallback? = nil,
    onReceiveProgress: ProgressCallback? = nil
  ) async throws -> Response
```

### Response type

```swift
public class Response{
  // The data of response body
  let data: Data
  // This feature is implementes in the future
  let statusCode: StatusCode
  let mimeType: String
  let date: Date?
  let contentLength: Int
  // You can get raw http response data.
  // Now, you can extract statusCode
  // in the header structed by json type
  let respnseHeader: URLResponse
  }
```

If you can get a response successfully, you can convert data type as swift type.

```swift
let response = try await sio.postUri(uri: URL(string: "http://127.0.0.1:8000/api/post/uri/json")!)

let map: [String: Any] = response.json
let text: String = response.text
// let data = response.data : default
```

## Exception

When an error occurs, Sio will wrap the `Error` to a `SioError`
// Got 404
do {
  let response = try await sio.get(path: "api/get/json")
} catch {
  print(error.message) // 404 - Not Found
  print(error.statusCode) // StatusCode.not_found
}

## Welcome to Contribute 👋
If you feel good to use this library and you want it to be better,
feel free to make a issue and comment it.
