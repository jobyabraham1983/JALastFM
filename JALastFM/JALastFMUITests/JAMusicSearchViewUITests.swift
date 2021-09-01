//
//  JALastFMUITests.swift
//  JALastFMUITests
//
//  Created by joby.abraham on 02/07/21.
//

import XCTest

class JAMusicSearchViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDropdownOptions() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        XCTAssertTrue(options.count == 3, "App supports exactly three types of search")
        
        XCTAssertTrue(options.element(boundBy: 0).label == "Album", "First search type should be 'Album'")
        XCTAssertTrue(options.element(boundBy: 1).label == "Artist", "First search type should be 'Artist'")
        XCTAssertTrue(options.element(boundBy: 2).label == "Track", "First search type should be 'Track'")
    }

    func testSearchAlbumWithValidKeyword() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 0).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("Believer")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count > 0, "Search result should not be zero")
    }

    func testSearchAlbumWithEmptyKeyword() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 0).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count == 0, "Search result should be zero")
    }
    
    func testSearchArtistWithValidKeyword() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 1).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("Believer")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count > 0, "Search result should not be zero")
    }
    
    func testSearchArtistWithEmptyKeyword() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 1).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count == 0, "Search result should be zero")
    }
    
    func testSearchTrackWithValidKeyword() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 2).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("Believer")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count > 0, "Search result should not be zero")
    }
    
    func testSearchTrackWithEmptyKeyword() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 2).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count == 0, "Search result should be zero")
    }
    
    func testAlbumDetailsViewNavigation() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // selection option
        let dropdownButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "JADropdownButtonId")
        dropdownButton.tap()
        let options = app.buttons.matching(XCUIElement.ElementType.button, identifier: "JADropdownOptionElementId")
        options.element(boundBy: 0).tap()
        dropdownButton.tap()
        
        let keywordTextControl = app.textFields.firstMatch
        let search = app.buttons["Search"]
        keywordTextControl.tap()
        keywordTextControl.typeText("Believer")
        search.tap()
        app.tables.firstMatch.swipeUp()
        let cells = app.tables.firstMatch.cells
        XCTAssertTrue(cells.count > 0, "Search result should not be zero")
        
        let cell = cells.element(boundBy: 0)
        cell.tap()
        let textView = app.staticTexts.element(matching: XCUIElement.ElementType.staticText, identifier: "JAMusicDetailsViewNameLabelId")
        XCTAssertTrue(textView.label != "", "Search result should not be zero")
    }

    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
