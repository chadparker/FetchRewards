//
//  FetchRewardsTests.swift
//  FetchRewardsTests
//
//  Created by Chad Parker on 4/12/21.
//

import XCTest
@testable import FetchRewards

class FetchRewardsTests: XCTestCase {
    
    var seatGeekClient = SeatGeekClient()

    func testFetchAllEvents() throws {
        let expectation = self.expectation(description: "Waiting for SeatGeekClient")
        seatGeekClient.fetchAllEvents { result in
            switch result {
            case .success(let events):
                print("✅\(events.count) events fetched")
            case .failure(let networkError):
                print("🛑Error: \(networkError)")
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testFetchEventsMatchingQuery() throws {
        let expectation = self.expectation(description: "Waiting for SeatGeekClient")
        seatGeekClient.fetchEventsMatchingQuery("football") { result in
            switch result {
            case .success(let events):
                print("✅\(events.count) events fetched")
            case .failure(let networkError):
                print("🛑Error: \(networkError)")
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
