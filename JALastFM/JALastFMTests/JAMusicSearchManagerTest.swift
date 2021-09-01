//
//  JALastFMTests.swift
//  JALastFMTests
//
//  Created by joby.abraham on 02/07/21.
//

import XCTest
@testable import JALastFM

class JAMusicSearchManagerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testMusicSearchManagerSingleInstance() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        XCTAssertNotNil(musicSearchManager)
    }

    func testMusicSearchManagerAlbumSearchWithKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Album", keyword: "beliver") { musicData in
            XCTAssert((musicData.count != 0), "Search failed to get data")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerAlbumSearchWithEmptyKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Album", keyword: "") { musicData in
            XCTAssert((musicData.count == 0), "Search should not return any data for empty search")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerArtistSearchWithKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Artist", keyword: "beliver") { musicData in
            XCTAssert((musicData.count != 0), "Search failed to get data")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerTrackSearchWithEmptyKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Track", keyword: "") { musicData in
            XCTAssert((musicData.count == 0), "Search should not return any data for empty search")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerTrackSearchWithKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Track", keyword: "beliver") { musicData in
            XCTAssert((musicData.count != 0), "Search failed to get data")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerArtistSearchWithEmptyKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Artist", keyword: "") { musicData in
            XCTAssert((musicData.count == 0), "Search should not return any data for empty search")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerUnsupportedFilterSearchWithKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Country", keyword: "beliver") { musicData in
            XCTAssert((musicData.count == 0), "Search should not return any data for Unsupported Filter Search")
        }
        sleep(1)
    }
    
    func testMusicSearchManagerUnsupportedFilterSearchWithEmptyKeyword() throws {
        let musicSearchManager = JAMusicSearchManager.sharedInstance
        musicSearchManager.search(method: "Country", keyword: "") { musicData in
            XCTAssert((musicData.count == 0), "Search should not return any data for empty search")
        }
        sleep(1)
    }
}
