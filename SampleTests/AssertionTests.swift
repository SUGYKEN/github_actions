//
//  AssertionTests.swift
//  SampleTests
//
//  Created by Ken on 2021/10/30.
//

import XCTest
@testable import Sample

class AssertionTests: XCTestCase {

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
    
    // ======================================
    var ass: AssertionTest!
    
    override func setUp() {
        super.setUp()
        self.ass = AssertionTest()
    }
    
    func testBool() {
        let string = ass.boolString()
        XCTAssertTrue(string.hasPrefix("Hel")) // Helから始まる
        XCTAssertFalse(string.isEmpty) // 空ではない
    }

    func testNil() {
        let notNumber = ass.nilString()
        XCTAssertNil(Int(notNumber)) // Intに変換できない
        
        let number = ass.nilInt()
        XCTAssertNotNil(Int(number)) // Intに変換できる
    }
    
    func testEqual() {
        let string = ass.equalString()
        XCTAssertEqual(string, "Hello")
        XCTAssertNotEqual(string, "GoodBye")
    }
    
    
    // オブジェクト
    func testEqualObject() {
        let dog1 = Dog(name: "ぽち", age: 2)
        let dog2 = Dog(name: "ジョン", age: 2)
        XCTAssertNotEqual(dog1, dog2)
        // 独自の型（構造体）ではEquatlbeプロトコルに準拠していないとNG！
    }
    
    // 意図的な失敗を投げる
    func testIntentionFailure() {
        // falseの場合はhandlerが実行されないことが期待値！
        ass.executeClosure(false, handler: { () in XCTFail()})
        ass.executeClosure(false) {
            XCTFail()
        }
    }
    
    
}
