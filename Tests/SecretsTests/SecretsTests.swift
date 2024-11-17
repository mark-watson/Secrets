import XCTest
import Foundation

@testable import Secrets

final class SecretsTests: XCTestCase {
    func testSecrets() {
        if let apiKey = getAPIKey(key: "OPENAI_API_KEY") {
          print("API Key: \(apiKey)")
        } else {
          print("Failed to load API key")
        }
    }
}
