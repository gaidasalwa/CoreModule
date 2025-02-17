//
//  Response.swift
//  HTTPClient
//
//  Created by Gaida Salwa on 11/02/2025.
//

import Foundation

public struct AdListResponse: Decodable {
    public let paging: Paging?
    public let data: [AdResponse]
    
    // Décode un tableau vide si "data" est absent
    private enum CodingKeys: String, CodingKey {
        case paging, data
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        paging = try container.decodeIfPresent(Paging.self, forKey: .paging)
        data = try container.decodeIfPresent([AdResponse].self, forKey: .data) ?? []
    }
}

public struct Paging: Decodable {
    let pageLength: Int
    let after: String?
    let before: String?
}

public struct AdResponse: Decodable {
    public let id: String
    public let acquired: Bool
    public let available: Bool
    public let author: AuthorResponse
    public let category: String
    public let closed: Bool
    public let consumptionRule: ConsumptionRule?
    public let creationDateMs: Int
    public let description: String
    public let given: Bool
    public let location: LocationResponse
    public let lastModerationDateMs: Int?
    public let pictures: [PictureURLResponse]
    public let reserved: Bool
    public let searchId: String?
    public let state: String
    public let seller: Bool
    public let sellingInfo: String?
    public let stock: Int
    public let availableStock: Int
    public let title: String
    public let type: String
    public let universe: String
    public let unlockedCounter: Int
    public let unlocked: Bool
    public let unlockedCounterObfuscated: String
    public let updateDateMs: Int
    public let validated: Bool
    public let validationDateMs: Int
    public let validationStatus: String
    public let risenTimestampMs: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case acquired, available, author, category, closed, description, given, location, pictures, reserved, searchId, state, seller, stock, availableStock, title, type, universe, unlockedCounter, unlocked, unlockedCounterObfuscated, validated, validationStatus, sellingInfo
        case consumptionRule = "consumptionRule"
        case creationDateMs = "creationDateMs"
        case lastModerationDateMs = "lastModerationDateMs"
        case updateDateMs = "updateDateMs"
        case validationDateMs = "validationDateMs"
        case risenTimestampMs = "risenTimestampMs"
    }
}

public struct AuthorResponse: Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let type: String
    let picture: PictureURLResponse?
    let subscription: String?
}

public struct PictureURLResponse: Decodable {
    public let squares32: String?
    public let squares64: String?
    public let squares128: String?
    public let squares300: String?
    public let squares600: String?
    public let resizes1000: String?
}

public struct LocationResponse: Decodable {
    let city: String
    let country: String
    let department: String?
    public let latitude: Double
    public let longitude: Double
    let obfuscated: Bool
}

public struct ConsumptionRule: Decodable {
    let bananaExpirationMs: Int?
    let premiumExpirationMs: Int?
    let premiumExclusivityMinimumExpirationMs: Int?
}
