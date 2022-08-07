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

            }

            task.resume()
        }

        static func infoDataTask(url: URL, block: @escaping (Data) -> Void) {
                let task = session.dataTask(with: url) { data, response, error in
                    print("check")

                    guard error == nil else {
                        print(error.debugDescription)
                        return
                    }

                    guard let httpResponse = response as? HTTPURLResponse,
                          httpResponse.statusCode == 200 else { return }

                    guard let info = data else { return }

                    if let result = String(data: info, encoding: .utf8) {
                        print(result)
                    }

                    DispatchQueue.main.async {
                        block(info)
                    }
                }

                task.resume()
            }

}
