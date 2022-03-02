//
//  iOSWebViewUITests.swift
//  iOSWebViewUITests
//
//  Created by Jaron Patena on 3/2/22.
//

import XCTest

class iOSWebViewUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testLoginValidCredentials() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        sleep(5)
        
        let webViewsQuery = app.webViews.webViews.webViews
        
        let usernameTextField = webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Username"]/*[[".otherElements[\"Swag Labs\"].textFields[\"Username\"]",".textFields[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernameTextField.tap()
        usernameTextField.typeText("standard_user")

        let passwordTestField = webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"Swag Labs\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordTestField.tap()
        passwordTestField.typeText("secret_sauce")
        
        app.toolbars["Toolbar"].buttons["Done"].tap() // hide keyboard
        sleep(3)
        webViewsQuery.buttons["Login"].tap()
        sleep(2)

        XCTAssertTrue(webViewsQuery.staticTexts["PRODUCTS"].exists)
    }
    
    func testLoginInvalidCredentials() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        sleep(5)
        
        let webViewsQuery = app.webViews.webViews.webViews
        
        let usernameTextField = webViewsQuery/*@START_MENU_TOKEN@*/.textFields["Username"]/*[[".otherElements[\"Swag Labs\"].textFields[\"Username\"]",".textFields[\"Username\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernameTextField.tap()
        usernameTextField.typeText("standard_user")

        let passwordTestField = webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"Swag Labs\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordTestField.tap()
        passwordTestField.typeText("wrong_sauce")
        
        app.toolbars["Toolbar"].buttons["Done"].tap() // hide keyboard
        sleep(3)
        webViewsQuery.buttons["Login"].tap()
        sleep(2)

        XCTAssertFalse(webViewsQuery.staticTexts["PRODUCTS"].exists)
    }

}
