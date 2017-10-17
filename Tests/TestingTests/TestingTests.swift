import XCTest
@testable import Testing

class TestingTests: XCTestCase {
  
    static var allTests = [
      //("testFileDownload", testFileDownload),
      ("testDirectFileDownload", testDirectFileDownload)
    ]
  
    let strURL = "https://raw.githubusercontent.com/watson-developer-cloud/swift-sdk/master/Tests/DiscoveryV1Tests/metadata.json"

    func testFileDownload() {
      
      for _ in 0...50 {
        
        let expectation = self.expectation(description: "download file SwiftyRequest test")
        
        let request = RestRequest(url: strURL)
        
        let url = URL(string: strURL)!
        
        request.download(to: url) { source, response, error in
          expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10)
      }
    }

    func testDirectFileDownload() {
      
      let session = URLSession(configuration: URLSessionConfiguration.default)
      
      for _ in 0...10000 {
        
        let expectation = self.expectation(description: "download file SwiftyRequest test")
        
        let urlObject = URL(string: strURL)!
        let req = URLRequest(url: urlObject)
        

        let task = session.downloadTask(with: req) { (source, response, error) in
          expectation.fulfill()
        }

        task.resume()
        
        waitForExpectations(timeout: 10)
      }
    }
}
