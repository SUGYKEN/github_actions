//
//  Download.swift
//  Sample
//
//  Created by Ken on 2021/10/30.
//

import Foundation

enum DownloadError : Error {
    case connectionError // コネクションエラー
    case unknownError(code : Int) // 不明なエラー
}
extension DownloadError: Equatable {}


class Download {
    func downloadContent(connectionFailed:Bool) throws {
        
        if connectionFailed {
            throw DownloadError.connectionError
        }
        
        if !connectionFailed {
            throw DownloadError.unknownError(code: 9)
        }
    }
}
