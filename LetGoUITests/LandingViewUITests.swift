//
//  LandingViewUITests.swift
//  LetGoUITests
//
//  Created by Eva Madarasz
//

import XCTest

final class LandingViewUITests: XCTestCase {

    private var app: XCUIApplication!

       override func setUpWithError() throws {
           continueAfterFailure = false
           app = XCUIApplication()
           app.launch()
       }

       func testLandingViewElementsAreVisible() throws {
           let welcomeText = app.staticTexts["welcomeText"]
           XCTAssertTrue(welcomeText.waitForExistence(timeout: 3), "Welcome text not found")

        
           let enterButton = app.buttons["enterButton"]
           XCTAssertTrue(enterButton.waitForExistence(timeout: 3), "Enter LetGo button not found")

           let learnMoreButton = app.buttons["learnMoreButton"]
           XCTAssertTrue(learnMoreButton.waitForExistence(timeout: 3), "Learn More button not found")
       }

       func testLearnMoreButtonNavigatesToInformationView() throws {
           let learnMoreButton = app.buttons["learnMoreButton"]
           XCTAssertTrue(learnMoreButton.waitForExistence(timeout: 3), "Learn More button not found")

           learnMoreButton.tap()

           let infoViewContent = app.staticTexts["InformationViewRoot"]
             XCTAssertTrue(infoViewContent.waitForExistence(timeout: 5), "Did not navigate to InformationView")
       }
}
