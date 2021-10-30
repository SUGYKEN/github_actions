//
//  DownloadTests.swift
//  SampleTests
//
//  Created by Ken on 2021/10/31.
//

import XCTest
@testable import Sample

class DownloadTests: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testMethod() {
        let dw = Download()
        XCTAssertThrowsError(try dw.downloadContent(connectionFailed: true))
        XCTAssertThrowsError(
            try dw.downloadContent(connectionFailed: true))
            {(error: Error) -> Void in
            XCTAssertEqual(error as? DownloadError, DownloadError.connectionError)
        }
    }
    
}
