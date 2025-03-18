//
//  InformationViewUITests.swift
//  LetGoUITests
//
//  Created by Eva Madarasz
//

import XCTest

final class InformationViewUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        // Navigate to InformationView if it's not the root view
        let learnMoreButton = app.buttons["learnMoreButton"]
        if learnMoreButton.exists {
            learnMoreButton.tap()
        }
    }

    func testInformationViewLoadsSuccessfully() throws {
        let infoRoot = app.staticTexts["InformationViewRoot"]
        XCTAssertTrue(infoRoot.waitForExistence(timeout: 3), "Failed to load InformationView")
    }

    func testSectionsAreVisibleInInformationView() throws {
        // Confirm key headings exist
        XCTAssertTrue(app.staticTexts["🔹 The 'Let Them' Theory"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["🔹 The 'Let Me' Theory"].exists)
        XCTAssertTrue(app.staticTexts["✋ What is EFT Tapping?"].exists)
        XCTAssertTrue(app.staticTexts["🔄 How to Practice EFT Tapping"].exists)
        XCTAssertTrue(app.staticTexts["📚 Recommended Books"].exists)
    }

    func testScrollToBooksSection() throws {
        let booksSection = app.staticTexts["📚 Recommended Books"]

        // Try scrolling to find the books section
        app.swipeUp(velocity: .fast)
        app.swipeUp(velocity: .fast)

        XCTAssertTrue(booksSection.waitForExistence(timeout: 4), "Could not find the Recommended Books section")
    }
}

