//
//  Endpoint.swift
//  HTTPClient
//
//  Created by Gaida Salwa on 11/02/2025.
//


import Foundation
import Alamofire

/// **Pourquoi utiliser `Endpoint` ?**
///
/// - **Centralise la création des requêtes HTTP** → Assure une cohérence dans toute l’application.
/// - **Évite les répétitions** → Plus besoin de reconstruire des `URLRequest` à chaque appel API.
/// - **Facilite les tests** → On peut facilement **mocker un `Endpoint`** pour tester les requêtes sans dépendre du serveur.
public struct Endpoint {
    
    /// **Requête HTTP générée à partir des paramètres fournis**
    public var urlRequest: URLRequest

    /// **Initialisation d’un `Endpoint`**
    ///
    /// - Parameters:
    ///   - url: **URL de la requête** (ex: `"https://api.example.com/items"`)
    ///   - parameters: **Paramètres GET** (ex: `?limit=20`), par défaut `nil`
    ///   - method: **Méthode HTTP** (`.get`, `.post`...), par défaut `.get`
    ///   - cachePolicy: **Politique de cache** (`.useProtocolCachePolicy` par défaut)
    ///   - headers: **En-têtes HTTP** (ex: `["Authorization": "Bearer token"]`), par défaut `nil`
    ///   - body: **Corps de la requête** (utile pour `POST`/`PUT`), par défaut `nil`
    ///   - timeOutInterval: **Délai avant expiration** (ex: `30` secondes par défaut)
    ///
    /// - Throws: `EndpointError.invalidURL` si l’URL fournie est invalide.
    public init(url: String,
                parameters: [URLQueryItem]? = nil,
                method: HTTPMethod = .get,
                cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
                headers: HTTPHeaders? = nil,
                body: Data? = nil,
                timeOutInterval: TimeInterval = 30.0) throws {
        
        // Création de l'URL avec ses composants
        var components = URLComponents(string: url)
        
        // Ajout des paramètres GET si fournis
        if let parameters = parameters {
            components?.queryItems = parameters
        }

        // Vérification que l'URL est valide, sinon on lève une erreur
        guard let urlFromString = components?.url else {
            throw EndpointError.invalidURL
        }

        // Création de l'URLRequest
        urlRequest = URLRequest(url: urlFromString)
        urlRequest.method = method
        urlRequest.cachePolicy = cachePolicy
        urlRequest.timeoutInterval = timeOutInterval

        // Ajout des headers si fournis
        if let headers = headers {
            urlRequest.headers = headers
        }

        // Ajout du body si fourni (utile pour les requêtes POST/PUT)
        if let body = body {
            urlRequest.httpBody = body
        }
    }
}

/// **Erreurs possibles lors de la création d’un `Endpoint`**
public enum EndpointError: Error {
    case invalidURL
}
