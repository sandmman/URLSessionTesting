import Foundation

class RestRequest {
  
  private let session = URLSession(configuration: URLSessionConfiguration.default)
  
  private var url: String
  
  public init(url: String) {
    self.url = url
  }

  public func download(to destination: URL, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) {

    let urlObject = URL(string: url)!
    let req = URLRequest(url: urlObject)
    let task = session.downloadTask(with: req, completionHandler: completionHandler)
    task.resume()
  }
}
