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
    let imageURLString: String
    
    enum EventKeys: String, CodingKey {
        case title
        case date = "datetime_local"
        case venue
        case performers
    }
    
    enum VenueKeys: String, CodingKey {
        case displayLocation = "display_location"
    }
    
    enum PerformerKeys: String, CodingKey {
        case images
    }
    
    enum ImageKeys: String, CodingKey {
        case huge
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventKeys.self)
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(Date.self, forKey: .date)
        
        let venue = try container.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
        displayLocation = try venue.decode(String.self, forKey: .displayLocation)
        
        var performers = try container.nestedUnkeyedContainer(forKey: .performers)
        // get first performer
        let performer = try performers.nestedContainer(keyedBy: PerformerKeys.self)
        let images = try performer.nestedContainer(keyedBy: ImageKeys.self, forKey: .images)
        imageURLString = try images.decode(String.self, forKey: .huge)
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
