//
//  WeatherDataLoader.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

protocol DataLoader {
    var network: Networking { get }
    func loadData(searchData: WeatherSearchModel, completion: @escaping(Result<Weather, WeatherSearchError>) -> Void)
    func getImageUrl(imageName: String) -> URL?
}

extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .weather(let params):
            let params = params.trimSpaces().replacingOccurrences(of: " ", with: "%20")
            guard let url = URL(
                string: "https://community-open-weather-map.p.rapidapi.com/forecast?units=imperial&\(params)")
                else {
                    preconditionFailure("Invalid URL used to create URL instance")
            }
            let headers = [
                "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
                "x-rapidapi-key": "4e5ca8ed57msh14f6e3269a6ef6ap1c1854jsndec9e5c0bbaf"
            ]
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            return request
        }
    }
}

class WeatherService: NSObject, DataLoader {
    var network: Networking
    init(network: Networking = NetworkHandler()) {
        self.network = network
        super.init()
    }

    func loadData(searchData: WeatherSearchModel, completion: @escaping(Result<Weather, WeatherSearchError>) -> Void) {
        guard let endPoint = getEndPoint(searchData: searchData) else {
            completion(.failure(.invalidSearchInput))
            return
        }

        network.fetch(endPoint) { (result) in
            switch result {
            case .failure(let error):
                switch error {
                case .network(let statusCode):
                    if statusCode == 404 {
                        completion(.failure(.noDataFound))
                    } else {
                        completion(.failure(.errorRetriveData))
                    }
                case .backendError:
                    completion(.failure(.errorRetriveData))
                case .invalidData:
                    completion(.failure(.errorRetriveData))
                }
            case .success(let data):
                if let weather = try? JSONDecoder().decode(Weather.self, from: data) {
                    completion(.success(weather))
                    return
                }
                completion(.failure(.errorRetriveData))
            }
        }
    }

    func getImageUrl(imageName: String) -> URL? {
        return URL(string: "http://openweathermap.org/img/wn/\(imageName)@2x.png"
        )
    }

    // MARK: - private func
    private func getEndPoint(searchData: WeatherSearchModel) -> Endpoint? {
        if searchData.isCity() {
            return .weather(params: "q=\(searchData.userInput)")
        } else if searchData.isValidZipCode() {
            return .weather(params: "zip=\(searchData.userInput)")
        }
        return nil
    }
}
