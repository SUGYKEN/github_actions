//
//  Assertion.swift
//  Sample
//
//  Created by Ken on 2021/10/30.
//

import Foundation

struct Dog {
    var name : String
    var age : Int
}
extension Dog: Equatable {}

class AssertionTest {
    
    // Bool
    func boolString() -> String {
        return "Hello"
    }
    
    // Nil
    func nilString() -> String {
        return "Hello"
    }
    
    // Nil
    func nilInt() -> String {
        return "42"
    }
    
    // Equal
    func equalString() -> String {
        return "Hello"
    }
    
    // 意図的な失敗
    func executeClosure(_ condition: Bool, handler: () -> Void) {
        if condition {
            handler()
            // conditionがtrueの時だけhandlerが実行される
        }
    }
}
