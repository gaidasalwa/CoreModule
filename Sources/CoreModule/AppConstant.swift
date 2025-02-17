//
//  Constants.swift
//  SharedModels
//
//  Created by Gaida Salwa on 11/02/2025.
//

// Enum contenant les constantes de l'application
public enum AppConstant {
    /// Base URL de l'API
    public static let baseUrl: String = "https://prod.geev.fr/"
    
    /// URL pour récupérer la liste des annonces
    public static let listUrl: String = "v2/search/items/geo?limit=26"
    
    /// Modèle d'URL pour les détails d'une annonce
    public static func detailUrl(for id: String) -> String {
        return "v1/api/v0.19/articles/\(id)"
    }
}
