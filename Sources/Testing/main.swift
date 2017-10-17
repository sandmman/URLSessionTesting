//
//  main.swift
//  TestingPackageDescription
//
//  Created by Aaron Liberatore on 10/16/17.
//

import Foundation

var count = 0

let url = "https://raw.githubusercontent.com/watson-developer-cloud/swift-sdk/master/Tests/DiscoveryV1Tests/metadata.json"

let urlObject = URL(string: url)!
let req = URLRequest(url: urlObject)

for i in 0...50 {
  /*let task = session.downloadTask(with: req) { s, r, e in
    print("Done \(i)")
    count += 1
  }*/
  let session = URLSession(configuration: .default)
  let task = session.dataTask(with: req) { s, r, e in
    print("Done \(i)")
    count += 1
  }
  task.resume()
}

while count != 50 {}
