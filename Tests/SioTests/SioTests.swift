import XCTest

@testable import Sio

/// The Following Test Cases are coverd all paterns
///

/// - 2. Base URI + Path
/// - 3. Query Parameters
/// - 4. RequestHeader (Content-Header etc)
/// - 5. RequestMethod (GET, POST, PUT)
final class SioRealConnectionTest: XCTestCase {
  func testGetJson() async throws {
    var sio = Sio()
    Util.debugPrint(title: "\(#function)"){}
    sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
    do {
      // Get Json
      let response = try await sio.get(path: "api/get/json")
      Util.debugPrint(title: "Response in detail") {
        print("Data Size: \(response.data)")
        print("StatusCode: \(response.statusCode)")
        print("MimeType: \(response.mimeType)")
      }
      let dict = response.json ?? ["":""]

      Util.debugPrint(title: "Response Json") {
        print("\(String(describing: dict))")
      }
      XCTAssertEqual(dict.values.first as? String, "success_value")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }
  
  func testGetText() async throws {
    Util.debugPrint(title: "\(#function)"){}
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
    Util.debugPrint(title: "\(#function)"){}
    do {
      var sio = Sio()
      sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
      sio.baseOptions.mimeType = .json
      sio.baseOptions.queryParameters = ["example" : "1", "sample" : "2"]
      // Get Text
      let response = try await sio.get(path: "api/get/json/query")
      let json = response.json ?? ["":""]
      Util.debugPrint(title: "Response in detail") {
        print("\(String(describing: json))")
      }
      XCTAssertEqual(json.values.first as? String , "1")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }
  
//  func testGetBaseUrlWithQueryParams() async throws {
//    var sio = Sio()
//    sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
//    do {
//      let response = try await sio.get(path: "api/healthChecker")
//      Util.debugPrint(title: "Response in detail") {
//        print("Data: \(response.data)")
//        print("StatusCode: \(response.statusCode)")
//        print("MimeType: \(response.mimeType)")
//        print("Response Header: \(response.respnseHeader)")
//      }
//      let dict = response.json ?? ["":""]
//      print("\(String(describing: dict))")
//      XCTAssertEqual(dict.values.first as? String, "success_value")
//    } catch {
//      let error = error as! SioError
//      print(error.message)
//    }
//  }
  
  //  func testGetUri() async throws {
  //
  //  }
  //
  //  func testPost() async throws {
  //
  //  }
  //
  //  func testPostUri() async throws {
  //
  //  }
  //
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

final class SioMockTest: XCTestCase {

}
