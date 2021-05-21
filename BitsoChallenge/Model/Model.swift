//
//  Model.swift
//  BitsoChallenge
//
//  Created by Juan carlos De la parra on 06/05/21.
//

import Foundation

struct Book: Codable {
    var payload: [BookItem?]
}

struct BookItem: Codable {
    var book: String?
}

struct Prices: Codable {
    var payload: [BookPrice?]
}

struct BookPrice: Codable {
    var book: String?
    var volume: String?
    var high: String?
    var last: String?
    var low: String?
    var vwap: String?
    var ask: String?
    var bid: String?
}
