//
//  LetMeViewUITests.swift
//  LetGoUITests
//
//  Created by Eva Madarasz 
//

import XCTest

final class LetMeViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

        // Navigate to LetMeView
        let enterButton = app.buttons["enterButton"]
        XCTAssertTrue(enterButton.waitForExistence(timeout: 3), "Enter LetGo button not found")
        enterButton.tap()

        let letMeTab = app.buttons["Let Me"]
        XCTAssertTrue(letMeTab.waitForExistence(timeout: 3), "Let Me tab not found")
        letMeTab.tap()
    }

    func testLetMeViewLoadsSuccessfully() throws {
        let title = app.staticTexts["letMeTitle"]
        XCTAssertTrue(title.waitForExistence(timeout: 3), "LetMeView did not load properly")
    }

    func testTextEditorAllowsEmpowermentReflection() throws {
        let editor = app.textViews["empowermentEditor"]
        XCTAssertTrue(editor.waitForExistence(timeout: 3), "Empowerment TextEditor not found")

        editor.tap()
        editor.typeText("I choose to grow from my experience.")

        XCTAssertTrue(editor.value as? String == "I choose to grow from my experience.", "Reflection input not stored")
    }

}



