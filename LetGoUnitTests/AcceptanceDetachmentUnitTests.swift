//
//  AcceptanceDetachmentUnitTests.swift
//  LetGoUnitTests
//
//  Created by Eva Madarasz
//

import XCTest
import SwiftUI

@testable import LetGo


final class AcceptanceDetachmentUnitTests: XCTestCase {
    
    func testMockAffirmationServiceSetsAffirmation() {
        let service = AffirmationAPIMockService()
        let expectation = XCTestExpectation(description: "Affirmation should be set")

        service.fetchAffirmation(for: "fear")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            XCTAssertNotNil(service.affirmation)
            XCTAssertEqual(service.affirmation?.text, "You are brave even when you feel fear.")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }




}
