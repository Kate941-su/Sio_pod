import XCTest

@testable import Sio

final class SioTests: XCTestCase {
  func testExample() async throws {
    let sio = Sio()
    var options = BaseOptions()
    options.baseURI = URL(string: "http://127.0.0.1:8000/")
    options.path = "api/healthChecker"
    var result: Any
    do {
      result = try await sio.mockedRequestByPath(options: options)
    } catch {
      result = error
    }
    print(result)
  }
}
