//
//  MockNetworking.swift
//  WeatherAppTests
//
//  Created by Samar Khaled on 21/9/2020.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation
import Mocker
@testable import WeatherApp

class MockNetworking: Networking {

    var mockedStatusCode: Int
    var mockedData: Data

    init(mockedStatusCode: Int, mockedData: Data) {
        self.mockedStatusCode = mockedStatusCode
        self.mockedData = mockedData
    }

    func fetch(_ endpoint: Endpoint, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = URLSession(configuration: configuration)
        guard let apiEndpoint = endpoint.urlRequest.url else { return }
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: mockedStatusCode, data: [.get: mockedData])
        mock.register()

        sessionManager.dataTask(with: apiEndpoint) { (data, response, error) in
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
