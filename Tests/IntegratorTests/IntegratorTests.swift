import XCTest
import class Foundation.Bundle
@testable import Integrator

final class IntegratorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        go_to_project_folder(path: "/Users/ganeshfaterpekar/Documents/SaiProjects/Development/Pointzi_SH/ios_sdk_packages/SampleiOSProject/StoryBoardSwiftProject")
        copy_xcode_helper_script(projectPath: "")
        
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}
