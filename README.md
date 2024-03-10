# Sio Specifications

This project is affected by Dio flutter Http client package.

## HTTP Request

### Get

```swift
let sio = Sio()

// Simplest
var response: Response  = await sio.get('https://dart.dev')

// Get with query parametors
response = await dio.get(
  '/test',
  queryParameters: {'id': 12, 'name': 'dio'},
);

// Get with response type (Text(default), byte, Stream(after v1.0.0))
response = await dio.get<T = [Int]>(
  '/test',
  options: Options(responseType: ResponseType.byte),
);


print(response.data.toString())
```

### Post

```swift
let response: Response = await sio.post('/test', data: {'id': 12, 'name': 'dio'})

let response: Response = await sio.post('/test', data: {'id': 12, 'name': 'dio'}, onSendProgress: (int send, int total){  print(total) })
// The type of completion handler => (Int, Int) -> Void

enum ListFormat { //(v1 support)
  case FormD ata: (application/x-www-form-urlencoded)
  case Multipart Form Data: (multipart/form-data) => after v1?
  case Plain Text: (text/plain)
  case Binary Data: (binary)
  case XML: (application/xml)
}

```

### Download

```swift
let response: Response = await sio.download(xxx) // downloading a file for local device strage
```

### Put

```swift
let response: Response = await sio.put(xxx) // downloading a file for local device strage
```

### API

#### Basic Usage

```
let sio = Sio()
sio.options.baseURL = xxxx(: URL)
sio.options.connectTimeout = x(: TimeInterval (alias of Double))
sio.options.receiveTimeout = x(: TimeInterval (alias of Double))

let options: Options = BaseOptions(
  baseURL: URL,
  connectTimeout: TimeInterval,
  receiveTimeout: TimeInterval
)
let anotherSio: Sio = Sio(options)
```

#### Core API

**requestAPI**

```
Response<T> request<T>(
    uri: URL,
    data: Any?,
    queryParameters: [String: Any]?,
    cancelToken: CancelToken?,
    options: RequestOptions?,
    onSendProgress: ProgressCallback?,
    onReceiveProgress: ProgressCallback?
)
```

**Options**

```swift
responseType: ResponseType
  listFormat: ListFormat
  headers: [String : Any],
  validateStatus; // after v1
  receiveDataWhenStatusError;  // after v1
  extra:   // after v1
  followRedirects :Bool : // after v1
  maxRedirects: Int // after v1
  persistentConnection: Bool // after v1
```

get(), post(), request(), download(), put() call request()

BaseOptions <- implement or extend - RequestOptions

RequestEncoder => encoding request data from type of request options to URLSession.
ResponseDecoder => encoding response data from type of URLSession to response data.

### Exception

```swift
SioException : Exception, ResponseProtcol {
  errorCode: ResponseStatus?,// If timeout not needed
  message: ResponseStatus.message, // assume enum string
  response: Response? = nil,
  error: Any // v1 apply raw value of getting from URLSession.
}
```

### TypeAliase

```swift
public typealias RequestHeader = [String: Any]
public typealias ProgressCallback = (Int, Int) -> Void
```

# Knowladges

### GET: ⭐️

The GET method requests a representation of the specified resource. Requests using GET should only retrieve data.

### HEAD: ⭐️

The HEAD method asks for a response identical to a GET request, but without the response body.

### POST: ⭐️

The POST method submits an entity to the specified resource, often causing a change in state or side effects on the server.

### PUT: ⭐️

The PUT method replaces all current representations of the target resource with the request payload.

### DELETE

The DELETE method deletes the specified resource.

### CONNECT

The CONNECT method establishes a tunnel to the server identified by the target resource.

### OPTIONS

The OPTIONS method describes the communication options for the target resource.

### TRACE

The TRACE method performs a message loop-back test along the path to the target resource.

### PATCH

The PATCH method applies partial modifications to a resource.

Methods that is marked ⭐️ will be implemented at 1.0.0

## HTTP Response


## Sio API

### Options

#### Request Header

Host: URL

User-Agent: String?

Content-Type: String?

Content-Length: String? (not necessary)

Authorization: String?

Accept: String?

Cookie: String?

Cache-Control: クライアントがキャッシュの動作を指示するためのディレクティブを含みます。

Referer: リクエストが発生した元のページの URL を示します。

Origin: String?

#### Request Body

1. Text type (XML, JSON)

2. Form (application/x-www-form-urlencoded or multipart/form-data)

3. binary

post<T: where T : <String: Any>, Something Form Type, [Int]>

#### Default Options

#### Response Type

````swift
enum ResponseType {
/// Transform the response data to JSON object only when the
/// content-type of response is "application/json" .
case json

/// Transform the response data to an UTF-8 encoded [String].
case plain

/// Get the original bytes, the [Response.data] will be [List<int>].
case bytes

/// Get the response stream directly,
/// the [Response.data] will be [ResponseBody].
///
/// ```dart
/// Response<ResponseBody> rs = await Dio().get<ResponseBody>(
/// url,
/// options: Options(responseType: ResponseType.stream),
/// );
stream, // after v1
}
````
