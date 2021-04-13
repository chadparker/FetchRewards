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

    func testFetchEvents() throws {
        let expectation = self.expectation(description: "Waiting for SeatGeekClient")
        seatGeekClient.fetchEvents { result in
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
