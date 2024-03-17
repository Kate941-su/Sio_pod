import XCTest

@testable import Sio

/// The Following Test Cases are coverd all paterns
///

/// - 2. Base URI + Path
/// - 3. Query Parameters
/// - 4. RequestHeader (Content-Header etc)
/// - 5. RequestMethod (GET, POST, PUT)
final class SioGet: XCTestCase {
  func testGetJson() async throws {
    var sio = Sio()
    Util.debugPrint(title: "\(#function)")
    sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
    do {
      // Get Json
      let response = try await sio.get(path: "api/get/json")
      Util.debugPrint(title: "Response in detail") {
        print("Data Size: \(response.data)")
        print("StatusCode: \(response.statusCode)")
        print("MimeType: \(response.mimeType)")
      }

      guard let dict = response.json else {
        XCTAssert(false)
        return
      }

      Util.debugPrint(title: "Response Json") {
        print("\(String(describing: dict))")
      }
      XCTAssertEqual(dict["success_key"] as? String, "success_value")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }

  func testGetText() async throws {
    Util.debugPrint(title: "\(#function)") {}
    do {
      var sio = Sio()
      sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
      sio.baseOptions.mimeType = .plain_text
      // Get Text
      let response = try await sio.get(path: "api/get/text")
      let text = response.text
      Util.debugPrint(title: "Response in detail") {
        print("\(String(describing: text))")
      }
      XCTAssertEqual(text, "This Is Plain Text")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }

  func testGetJsonWithQuery() async throws {
    Util.debugPrint(title: "\(#function)") {}
    do {
      var sio = Sio()
      sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
      sio.baseOptions.mimeType = .json
      sio.baseOptions.queryParameters = ["test1": "1", "test2": "2"]
      // Get Text
      let response = try await sio.get(path: "api/get/json/query")
      guard let json = response.json else {
        XCTAssert(false, "Could not parse json")
        return
      }
      Util.debugPrint(title: "Response in detail") {
        print("\(String(describing: json))")
      }
      XCTAssertEqual(json["test1"] as? String, "1")
      XCTAssertEqual(json["test2"] as? String, "2")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }
  //  func testDownload() async throws {
  //
  //  }
  //
  //  func testPut() async throws {
  //
  //  }
  //
  //  func testPutUri() async throws {
  //
  //  }

}

final class SioGetUri: XCTestCase {
  func testGetUri() async throws {
    let sio = Sio()
    let response = try await sio.getUri(uri: URL(string: "http://127.0.0.1:8000/api/get/json")!)
    guard let json = response.json else {
      XCTAssert(false, "Could not parse json")
      return
    }
    XCTAssertEqual(json.values.first as? String, "success_value")
  }
}

final class SioPost: XCTestCase {
  func testPostJson() async throws {
    do {
      Util.debugPrint(title: "\(#function)") {}
      var defaultOptions = BaseOptions()
      let requestBodyDict: [String: Any] = ["name": "Kitaya", "age": 26]
      let requestJSON = try JSONSerialization.data(
        withJSONObject: requestBodyDict, options: .prettyPrinted)
      guard let requestBody = String(data: requestJSON, encoding: .utf8) else {
        print("Faild to parse json body")
        return
      }
      defaultOptions.body = requestBody.data(using: .utf8)
      var sio = Sio(options: defaultOptions)
      sio.baseOptions.requestHeader = [
        RequestHeader(headerField: "Content-Type", headerValue: "application/json")
      ]
      sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
      let response = try await sio.post(path: "api/post/json")
      guard let json = response.json else {
        print("\(#function) JSON doesn't existed")
        return
      }
      print("json: \(String(describing: json))")
      XCTAssertEqual(json["age"] as? Int, 26)
      XCTAssertEqual(json["name"] as? String, "Kitaya")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }
}

final class SioPostUri: XCTestCase {
  func testPostJson() async throws {
    do {
      Util.debugPrint(title: "\(#function)") {}
      var defaultOptions = BaseOptions()
      let requestBodyDict: [String: Any] = ["name": "Kitaya", "age": 26, "postUri": true]
      let requestJSON = try JSONSerialization.data(
        withJSONObject: requestBodyDict, options: .prettyPrinted)
      guard let requestBody = String(data: requestJSON, encoding: .utf8) else {
        print("Faild to parse json body")
        return
      }
      defaultOptions.body = requestBody.data(using: .utf8)
      var sio = Sio(options: defaultOptions)
      sio.baseOptions.requestHeader = [
        RequestHeader(headerField: "Content-Type", headerValue: "application/json")
      ]
      let response = try await sio.postUri(
        uri: URL(string: "http://127.0.0.1:8000/api/post/uri/json")!)
      guard let json = response.json else {
        print("\(#function) JSON doesn't existed")
        return
      }
      print("json: \(String(describing: json))")
      XCTAssertEqual(json["age"] as? Int, 26)
      XCTAssertEqual(json["name"] as? String, "Kitaya")
      XCTAssertEqual(json["postUri"] as? Bool, true)
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }
}
