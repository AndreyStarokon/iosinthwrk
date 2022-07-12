//
//  NetworkManager.swift
//  VK_app
//
//  Created by Ffhh Qerg on 12.07.2022.
//

import Foundation



struct NetworkManager {
    
        private static let session = URLSession.shared
            
            static func dataTask(url: URL) {
                let task = session.dataTask(with: url) {data, response, error in
                    
                    guard error == nil else {
                        print(error.debugDescription)
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
                    
                    print("allHeadersFields: \(httpResponse.allHeaderFields as! [String: Any])")
                    print("statusCode: \(httpResponse.statusCode)")
                    print("data: \(String(data: data!, encoding: .utf8))")
                }
                
                task.resume()
            }
}
