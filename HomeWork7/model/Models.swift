//
//  Models.swift
//  HomeWork7
//
//  Created by TrungNV (Macbook) on 12/05/2023.
//

import Foundation

struct User : Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case username
        case email
        case address
        case phone
        case website
        case company
    }
}

struct Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}

struct Geo: Codable {
    var lat: String
    var lon: String
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lon = "lng"
    }
}

struct Company: Codable {
    
}
