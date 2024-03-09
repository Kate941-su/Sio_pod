import XCTest

@testable import Sio

final class SioTests: XCTestCase {
  func testExample() async throws {
    let sio = Sio(options: BaseOptions())
    await sio.callGetJsonRequest()
    await sio.callGetJson404Request()
  }
}
