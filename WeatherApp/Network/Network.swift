//
//  Network.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

enum Endpoint {
    case weather(params: String)
}

protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

protocol Networking {
    func fetch(_ endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

enum NetworkError: Error {
    case backendError
    case network(statusCode: Int)
    case invalidData
}

struct NetworkHandler: Networking {
    func fetch(_ endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let urlRequest = endpoint.urlRequest
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.backendError))
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(.network(statusCode: httpResponse.statusCode)))
                return
            }
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
