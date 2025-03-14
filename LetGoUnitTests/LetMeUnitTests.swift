//
//  LetMeUnitTests.swift
//  LetGoUnitTests
//
//  Created by Eva Madarasz
//

import XCTest
import SwiftUI

@testable import LetGo


final class LetMeUnitTests: XCTestCase {

    func testDefaultReflectionIsEmpty() {
        let viewModel = LetMeViewModel()
        XCTAssertTrue(viewModel.empowermentReflection.isEmpty)
    }

    func testReflectionCanBeUpdated() {
        let viewModel = LetMeViewModel()
        viewModel.empowermentReflection = "I choose to believe in myself."
        XCTAssertEqual(viewModel.empowermentReflection, "I choose to believe in myself.")
    }

  func testAffirmationText() {
        let viewModel = LetMeViewModel()
        XCTAssertEqual(viewModel.affirmationText, "Let me embrace my power and make positive changes.")
    }
}
