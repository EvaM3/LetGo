//
//  LetThemViewUITests.swift
//  LetGoUITests
//
//  Created by Eva Madarasz
//


import XCTest

final class LetThemViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testLetThemViewLoadsAfterEntering() throws {
        // Tap the Enter 
        let enterButton = app.buttons["enterButton"]
        XCTAssertTrue(enterButton.waitForExistence(timeout: 3), "Enter LetGo button not found")
        enterButton.tap()

        // Wait for LetThemView to load
        let letThemTitle = app.staticTexts["letThemTitle"]
        XCTAssertTrue(letThemTitle.waitForExistence(timeout: 5), "LetThemView did not load")
    }

    func testScenarioMenuExistsAndOpens() throws {
        let enterButton = app.buttons["enterButton"]
        XCTAssertTrue(enterButton.waitForExistence(timeout: 3))
        enterButton.tap()

        let scenarioMenu = app.buttons["scenarioMenu"]
        XCTAssertTrue(scenarioMenu.waitForExistence(timeout: 5), "Scenario menu not found")
        scenarioMenu.tap()

        // Optional: Check that one of the options appears
        let option = app.buttons["scenario-Let them walk away."]
        XCTAssertTrue(option.waitForExistence(timeout: 2), "Scenario option not visible after tap")
    }

    func testTextEditorAllowsInput() throws {
        let enterButton = app.buttons["enterButton"]
        enterButton.tap()

        let editor = app.textViews["reflectionEditor"]
        XCTAssertTrue(editor.waitForExistence(timeout: 5), "Reflection TextEditor not found")

        editor.tap()
        editor.typeText("Let them be themselves.")
        XCTAssertTrue(editor.value as? String == "Let them be themselves.", "TextEditor did not accept input")
    }

}
