//
//  EString.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/11.
//

import UIKit
import SnapKit

// 扩展字符串：根据宽度截断文本
extension String {
    func truncated(toFitWidth width: CGFloat, font: UIFont) -> String {
        let ellipsis = "..." // 省略号
        var truncatedString = self
        
        // 计算省略号宽度
        let ellipsisWidth = (ellipsis as NSString).size(withAttributes: [.font: font]).width
        
        // 最大允许宽度
        let maxWidth = width - ellipsisWidth
        
        while (truncatedString as NSString).size(withAttributes: [.font: font]).width > maxWidth {
            truncatedString.removeLast()
            return truncatedString + ellipsis
        }
        
        return truncatedString
    }
}
