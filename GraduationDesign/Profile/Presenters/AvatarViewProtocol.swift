//
//  AvatarViewProtocol.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit

protocol AvatarViewProtocol: AnyObject {
    func showAvatar(image: UIImage)
    func showError(_ message: String)
    func showFullScreenAvatar(image: UIImage)
}
