//
//  Event.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/12/21.
//

import Foundation

struct Event: Codable {
    let title: String
    let date: Date
    let venue: Venue
    
    enum CodingKeys: String, CodingKey {
        case title
        case date = "datetime_local"
        case venue
    }
    
    struct Venue: Codable {
        let displayLocation: String
        
        enum CodingKeys: String, CodingKey {
            case displayLocation = "display_location"
        }
    }
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601WithoutTimezone)
        return decoder
    }()
    
    static var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601WithoutTimezone)
        return encoder
    }()
}

struct EventsResponse: Codable {
    let events: [Event]
}
