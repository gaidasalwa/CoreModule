//
//  AdResponse.swift
//  HTTPClient
//
//  Created by Gaida Salwa on 12/02/2025.
//


import Foundation

// MARK: - AdResponse
public struct AdDetailResponse: Decodable {
    public let id: String
    public let title: String
    public let description: String
    public let type: String
    public let pictures: [String]
    public let parentCategoryLabel: String
    public let category: String
    public let subCategory: String
    public let carbonValue: Double
    public let savings: Int
    public let location: LocationResponse
    public let creationTimestamp: Int
    public let lastUpdateTimestamp: Int
    public let unlockedCounter: Int
    public let userAvailability: String
    public let state: String
    public let complaints: Complaints
    public let closed: Bool
    public let available: Bool
    public let validated: Bool
    public let validationStatus: String
    public let author: AuthorDetailResponse
    public let universe: String
    public let randomCode: String
    public let reserved: Bool
    public let given: Bool
    public let acquired: Bool
    public let potentialChosen: [String]
    public let isSeller: Bool
    public let scam: Bool
    public let safe: Bool
    public let takeBackPartner: String?
    public let viewsCount: Int
    public let targetAudiences: [String]
    public let risenDates: [RisenDate]
    public let createdAt: String
    public let updatedAt: String
    public let lastModerationTimestamp: Int
    public let validationTimestamp: Int
    public let consumptionRule: ConsumptionRule
    public let lifecycleRules: LifecycleRules
    public let closingDateRequested: String
    public let city: String
    public let country: String
    public let department: String?
    public let region: String
    public let bigSavings: Bool
    public let availableStock: Int
    public let risenTimestampMs: Int
    public let metadata: Metadata
    public let unlocked: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, description, type, pictures
        case parentCategoryLabel = "parent_category_label"
        case category, subCategory, carbonValue, savings, location
        case creationTimestamp = "creation_timestamp"
        case lastUpdateTimestamp = "last_update_timestamp"
        case unlockedCounter = "unlocked_counter"
        case userAvailability = "user_availability"
        case state, complaints, closed, available, validated
        case validationStatus = "validation_status"
        case author, universe, randomCode, reserved, given, acquired
        case potentialChosen = "potential_chosen"
        case isSeller = "is_seller"
        case scam, safe, takeBackPartner, viewsCount, targetAudiences
        case risenDates, createdAt, updatedAt
        case lastModerationTimestamp = "last_moderation_timestamp"
        case validationTimestamp = "validation_timestamp"
        case consumptionRule = "consumption_rule"
        case lifecycleRules = "lifecycleRules"
        case closingDateRequested, city, country, department, region
        case bigSavings, availableStock
        case risenTimestampMs = "risenTimestampMs"
        case metadata, unlocked
    }
}

public struct AuthorDetailResponse: Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let picture: String?
    let language: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case picture, language
    }
}

// MARK: - Complaints
public struct Complaints: Codable {
    let spam: Int
    let offensive: Int
    let total: Int
}

// MARK: - RisenDate
public struct RisenDate: Codable {
    let date: String
    let mode: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case date, mode
        case id = "_id"
    }
}

// MARK: - LifecycleRules
public struct LifecycleRules: Codable {
    let rising: Rising
}

// MARK: - Rising
public struct Rising: Codable {
    let programmedRisenDate: String?
    let maxActiveConversations: Int?
    let authorShouldHaveResponded: Bool
}

// MARK: - Metadata
public struct Metadata: Codable {
    let manuallyRisen: Bool
}
