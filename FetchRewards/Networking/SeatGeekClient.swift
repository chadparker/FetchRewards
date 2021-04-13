//
//  SeatGeekClient.swift
//  FetchRewards
//
//  Created by Chad Parker on 4/12/21.
//

import Foundation

enum NetworkError : Error {
    case dataTask(Error)
    case noData
    case parseError(Error)
}

class SeatGeekClient {
    
    let baseURL = URL(string: "https://api.seatgeek.com/2/")!
    
    func fetchAllEvents(completion: @escaping (Result<[Event], NetworkError>) -> Void) {
        
        let url = baseURL.appendingPathComponent("events")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Secrets.clientID),
            URLQueryItem(name: "client_secret", value: Secrets.clientSecret),
        ]
        
        URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async { completion(.failure(.dataTask(error!))) }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(.noData)) }
                return
            }
            do {
                let eventsResponse = try Event.decoder.decode(EventsResponse.self, from: data)
                DispatchQueue.main.async { completion(.success(eventsResponse.events)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(.parseError(error))) }
            }
        }.resume()
    }
    
    func fetchEventsMatchingQuery(_ query: String, completion: @escaping (Result<[Event], NetworkError>) -> Void) {
        
        let url = baseURL.appendingPathComponent("events")
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Secrets.clientID),
            URLQueryItem(name: "client_secret", value: Secrets.clientSecret),
            URLQueryItem(name: "q", value: query),
        ]
        
        URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async { completion(.failure(.dataTask(error!))) }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(.noData)) }
                return
            }
            do {
                let eventsResponse = try Event.decoder.decode(EventsResponse.self, from: data)
                DispatchQueue.main.async { completion(.success(eventsResponse.events)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(.parseError(error))) }
            }
        }.resume()
    }
}
