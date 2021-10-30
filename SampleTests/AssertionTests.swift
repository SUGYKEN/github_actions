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
    
    // オブジェクト 階層
    func testEqualObjectNested() {
        
        XCTContext.runActivity(named: "ぽちとジョン") { _ in
            XCTContext.runActivity(named: "ぽちとジョン") {_ in
                let dog1 = Dog(name: "ぽち", age: 2)
                let dog2 = Dog(name: "ジョン", age: 2)
                XCTAssertNotEqual(dog1, dog2)
            }
            XCTContext.runActivity(named: "ジョンとジョン") {_ in
                let dog1 = Dog(name: "ジョン", age: 2)
                let dog2 = Dog(name: "ジョン", age: 2)
                XCTAssertEqual(dog1, dog2)
            }
        }
        
        XCTContext.runActivity(named: "ぽちとジョンと年齢") { _ in
            let dog1 = Dog(name: "ジョン", age: 3)
            let dog2 = Dog(name: "ジョン", age: 2)
            XCTAssertNotEqual(dog1, dog2)
        }
        // 独自の型（構造体）ではEquatlbeプロトコルに準拠していないとNG！
    }

    
    // 新しく追加されたUnwrap！！
    func testExampleUnwrap() {
        
        let string: String? = "Hello"
        
        // `nil`でないことを検証＋アンラップ
        guard let s = string else { XCTAssertNotNil(string); return }
        
        // 検証
        XCTAssertEqual(s, "Hello")
    }
    
    func testExampleUnwrap2() throws { // `throws`キーワードが必要な点に注意
        
        let string: String? = "Hello"
        
        // `nil`でないことを検証＋アンラップ
        let s = try XCTUnwrap(string)
        
        // 検証
        XCTAssertEqual(s, "Hello")
        
        /*
         なお、guard letではなく強制アンラップ（!）を利用すれば、 XCTUnwrap()を利用せずともシンプルに書けるのではないか、 と感じた方もいるかもしれません。

         強制アンラップは記述こそ簡単ですが、 アンラップの失敗によりテストケースが失敗した場合、 「どの箇所で失敗したのか」という情報が失われ原因調査にコストがかかるという欠点があります。

         なので、オプショナル型の中身を取り出して検証したい場合は、 今回追加されたXCTUnwrap()を利用していくとよいでしょう。
         
         */
    }
    
}
