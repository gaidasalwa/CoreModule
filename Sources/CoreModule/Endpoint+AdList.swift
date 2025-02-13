//
//  Endpoint+AdList.swift
//  HTTPClient
//
//  Created by Gaida Salwa on 11/02/2025.
//

import Alamofire
import Foundation

public extension Endpoint {
    /// Récuprer la liste des annonces
    /// - Parameter body: Le json contenant les parametres de la simulation
    /// - Returns: Endpoint AdList
    static func fetchAdList(body: Data) -> Endpoint {
        let headers = HTTPHeaders(arrayLiteral:
            HTTPHeader(name: "Content-Type", value: "application/json"))

        let urlResult = AppConstant.baseUrl + AppConstant.listUrl

        return Endpoint(url: urlResult, method: .post, headers: headers, body: body)
    }
}
