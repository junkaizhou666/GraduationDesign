//
//  MessageButtonStack.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class MessageButtonStack: UIStackView {
    init(buttons: MessageButtonStruct) {
        super.init(frame: .zero)
        
        self.axis = .horizontal
        self.spacing = 10
        self.alignment = .fill
        self.distribution = .fillEqually
        
        var buttonsInRow: [UIButton] = []
        
        for (_, (image, buttonTitle)) in buttons.buttons.prefix(4).enumerated() {
            let button = createButton(image: image, buttonTitle: buttonTitle)
            buttonsInRow.append(button)
            self.addArrangedSubview(button)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButton(image: UIImage?, buttonTitle: String) -> UIButton {
        let button = UIButton(type: .custom)
        
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear // 清除背景颜色
        
        if let image = image {
            configuration.image = image
        }
        
        // 检查标题长度，超过4个字符时截断并添加省略号
        let trimmedTitle = buttonTitle.count > 4 ? String(buttonTitle.prefix(4)) + "…" : buttonTitle
        configuration.title = trimmedTitle
        
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        var titleAttributes = AttributeContainer()
        titleAttributes.font = UIFont.systemFont(ofSize: 14)
        titleAttributes.foregroundColor = UIColor.black
        configuration.attributedTitle = AttributedString(trimmedTitle, attributes: titleAttributes)
        
        button.configuration = configuration
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
