//
//  LetThemTests.swift
//  LetGoUnitTests
//
//  Created by Eva Sira Madarasz on 14/03/2025.
//

import XCTest
import SwiftUI

@testable import LetGo

final class LetThemTests: XCTestCase {
    
    func testInitialScenarioIsCorrect() throws {
        func testScenarioListContainsExpectedItems() {
            let view = LetThemView()
            let expected = [
                "Let them judge you.",
                "Let them walk away.",
                "Let them have their opinions.",
                "Let them misunderstand you."
            ]
            XCTAssertEqual(view.scenarios, expected)
        }
        
        
        func testSelectScenarioUpdatesSelectedScenario() {
            let viewModel = LetThemView()
            viewModel.selectScenario("Let them walk away.")
            XCTAssertEqual(viewModel.selectedScenario, "Let them walk away.")
        }
      
        
        func testUserReflectionUpdates() {
            let viewModel = LetThemView()
            viewModel.userReflection = "This is my reflection."
            XCTAssertEqual(viewModel.userReflection, "This is my reflection.")
        }
        
    }
}
