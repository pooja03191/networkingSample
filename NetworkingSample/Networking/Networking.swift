//
//  Networking.swift
//  NetworkingSample
//
//  Created by Pooja on 23/05/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

struct Networking {
    
    func performNetworkTask<T: Codable>(endpoint: GitHubAPI,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        
            let url = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
            let urlRequest = URLRequest(url: URL(string: url!)!)
        
            let urlSession = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            
            if let error = error {
                print("Unable to communicate \(error)")
            }
            guard let data = data else {
                return
            }
            
            let responseData = Response(data: data)
            
            guard let decodedData = responseData.decode(type) else { return }
            completion?(decodedData)
        }
        urlSession.resume()
    }
}
