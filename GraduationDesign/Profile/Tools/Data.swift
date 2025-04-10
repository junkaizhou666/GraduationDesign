//
//  Data.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
