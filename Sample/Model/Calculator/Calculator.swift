//
//  Calculator.swift
//  Sample
//
//  Created by Ken on 2021/10/30.
//

// テスト対象の演算クラスです

import Foundation

class Calculator {
    
    // 加算
    func add(_ x: Int, _ y: Int ) -> Int {
        return x + y
    }
    
    // 減算
    func subtract(_ x: Int, _ y: Int ) -> Int {
        return x - y
    }
    
    // 掛け算
    func multiple(_ x: Int, _ y: Int ) -> Int {
        return x * y
    }

    // 割り算
    func division(_ x: Int, _ y: Int ) -> Int {
        return x / y
    }

    
}
