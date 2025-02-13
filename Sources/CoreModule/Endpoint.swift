//
//  Endpoint.swift
//  HTTPClient
//
//  Created by Gaida Salwa on 11/02/2025.
//


import Alamofire
import Foundation

public struct Endpoint {
    public var urlRequest: URLRequest

    init(url: String,
         parameters: [URLQueryItem]? = nil,
         method: HTTPMethod = .get,
         cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
         headers: HTTPHeaders? = nil,
         body: Data? = nil,
         timeOutInterval: TimeInterval? = nil) {
        var components = URLComponents(string: url)
        if let parameters = parameters {
            components?.queryItems = parameters
        }

        guard let urlFromString = components?.url else {
            preconditionFailure(
                "Invalid URL"
            )
        }

        urlRequest = URLRequest(url: urlFromString)
        urlRequest.method = method
        urlRequest.cachePolicy = cachePolicy

        if let headers = headers {
            urlRequest.headers = headers
        }

        if let body = body {
            urlRequest.httpBody = body
        }
    }
}
