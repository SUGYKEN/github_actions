//
//  CalculatorTests.swift
//  SampleTests
//
//  Created by Ken on 2021/10/30.
//

import XCTest // XCTest Frameworkのインポート、XCTAssetなどのAPIはこのフレームワークに含まれる
@testable import Sample // テスト対象のモジュール（Target）をインポート、
// Target間が異なる場合は、通常はpublicやopenのものしかアクセスできないが。
// @testableでimportすることで、internalな要素にアクセスできる

class CalculatorTests: XCTestCase {

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

    
    // ===================↑デフォルト=======================
    func testAdd() { // testをメソッド名につけること(ここはAndroidも同じだった記憶)
        let result = calc.add(1, 2)
        XCTAssertEqual(result, 3)
    }
    
    func testSubstract() {
        XCTAssertEqual(calc.subtract(6,3), 3)
    }
    
    func testMultiple() {
        XCTAssertEqual(calc.multiple(6,3), 18)
    }

    func testDivision() {
        XCTAssertEqual(calc.division(6,3), 2)
    }

    // ===================↑テストメソッド=======================
    var calc: Calculator!
    
    override func setUp() { // 初期化処理
        super.setUp()
        self.calc = Calculator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // ===================↑ライフサイクル=======================
}
