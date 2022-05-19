//
//  HTTPClient.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

protocol iHTTPClient {

    func request<ResponseType: Decodable>(request: URLRequest, completion: @escaping (Result<ResponseType, Error>) -> Void)
}

class HTTPClient: iHTTPClient {

    private let session = URLSession(configuration: .default)
    private typealias Handler = (Data?, URLResponse?, Error?) -> Void
    private let decoder = JSONDecoder()
 
    func request<ResponseType: Decodable>(request: URLRequest, completion: @escaping (Result<ResponseType, Error>) -> Void) {

        let handler: Handler = { rawData, _, error in
            do {
                if let data = rawData {
                    let decoded = try self.decoder.decode(ResponseType.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decoded))
                    }
                }
                return
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        self.session.dataTask(with: request, completionHandler: handler).resume()
    }
    
}
