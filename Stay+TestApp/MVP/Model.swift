//
//  Model.swift
//  Stay+TestApp
//
//  Created by Victor on 19.02.2021.
//

import Foundation

struct TopLevelData: Codable {
    var error: Int
    var data: [Hotel]
}

// MARK: - Hotel
struct Hotel: Codable {
    var id: Int
    var address: String
    var isStaylisted: Bool
    var latitude, longitude: Double
    var image: String
    var stars: Int
    var reviewsCount: Int
    var reviewsScore, priceNight, rewardAmount: Double
    var reviewsScoreWord: String
    var price: Double
    var rewardPercent: Int
    var tax: Double
    var video: [String]
    var freeCancellation, prepayment: Bool
    var currency: Currency
    var title, type: String
    
    enum CodingKeys: String, CodingKey {
            case id, address
            case isStaylisted = "is_staylisted"
            case latitude, longitude, image, stars
            case reviewsCount = "reviews_count"
            case reviewsScore = "reviews_score"
            case reviewsScoreWord = "reviews_score_word"
            case price
            case priceNight = "price_night"
            case rewardAmount = "reward_amount"
            case rewardPercent = "reward_percent"
            case tax, video
            case freeCancellation = "free_cancellation"
            case prepayment, currency, title, type
        }
    
}

// MARK: - Currency
struct Currency: Codable {
    var symbol, name, code: String
}

