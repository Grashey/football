//
//  RequestBuilder.swift
//  Football
//
//  Created by Aleksandr Fetisov on 18.05.2022.
//

import Foundation

protocol iRequestBuilder {

    func makeRequest(route: Route) -> URLRequest

}

class RequestBuilder: iRequestBuilder {

    func makeRequest(route: Route) -> URLRequest {

        let components = URLComponents(string: route.makeURL())

        if let url = components?.url {
            var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
            request.httpMethod = route.method
            return request
        }
        return URLRequest(url: URL(fileURLWithPath: ""))
    }

}
