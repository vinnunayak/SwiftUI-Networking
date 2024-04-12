//
//  NetworkManager.swift
//  H4XOR
//
//  Created by Vinod Nayak Banavath on 12/04/24.
//

import Foundation

class NetworkManager: ObservableObject {

    @Published var posts = [Post]()

    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page#"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Results.self, from:safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
