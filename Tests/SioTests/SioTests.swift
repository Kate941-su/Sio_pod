import XCTest

@testable import Sio

/// The Following Test Cases are coverd all paterns
///

/// - 2. Base URI + Path
/// - 3. Query Parameters
/// - 4. RequestHeader (Content-Header etc)
/// - 5. RequestMethod (GET, POST, PUT)
final class SioRealConnectionTest: XCTestCase {
//  func testExample() async throws {
//    let sio = Sio()
//    var options = BaseOptions()
//    options.baseURI = URL(string: "http://127.0.0.1:8000/")
//    options.path = "api/healthChecker"
//    do {
//      let response = try await sio.mockedRequestByPath(options: options, requestMethod: .GET)
//      Util.debugPrint(title: "TEST Sio Response") {
//        print("\(#function) data : \(String(describing: response.data))")
//        print("\(#function) status code : \(String(describing: response.statusCode))")
//      }
//    } catch {
//      Util.debugPrint(title: "TEST Sio Error") {
//        print("\(#function) : correct result: \(error)")
//      }
//    }
//  }
  
  func testGetBaseUrlOnly() async throws {
    var sio = Sio()
    sio.baseOptions.baseURI = URL(string: "http://127.0.0.1:8000/")
    do {
      let response = try await sio.get(path: "api/healthChecker")
    } catch {
      let error = error as! SioError
      print(error.message)
    }
  }
  
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
