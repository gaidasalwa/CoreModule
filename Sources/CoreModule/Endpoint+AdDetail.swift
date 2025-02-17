//
//  Endpoint+AdDetail.swift
//  HTTPClient
//
//  Created by Gaida Salwa on 11/02/2025.
//

import Alamofire
import Foundation

public extension Endpoint {
    /// Récuprer les détails d'une annonce
    /// - Parameter identifier: l'identifian de l'annonce'
    /// - Returns: Endpoint AdDetail
    static func fetchAdDetail(identifier: String) -> Endpoint {
        let headers = HTTPHeaders(arrayLiteral:
                                    HTTPHeader(name: "Content-Type", value: "application/json"))
        
        let urlResult = AppConstant.baseUrl + AppConstant.detailUrl(for: identifier)
        
        guard let endpoint = try? Endpoint(url: urlResult, method: .get, headers: headers, body: nil) else {
            fatalError("❌ Impossible de créer l'Endpoint")
        }
        
        return endpoint
    }
}
