//
//  Event.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/12/21.
//

import Foundation

struct Event: Decodable {
    let title: String
    let date: Date
    let displayLocation: String
    
    enum EventKeys: String, CodingKey {
        case title
        case date = "datetime_local"
        case venue
    }
    
    enum VenueKeys: String, CodingKey {
        case displayLocation = "display_location"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventKeys.self)
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(Date.self, forKey: .date)
        let venue = try container.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
        displayLocation = try venue.decode(String.self, forKey: .displayLocation)
    }
    
    static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601WithoutTimezone)
        return decoder
    }()
}

struct EventsResponse: Decodable {
    let events: [Event]
}
