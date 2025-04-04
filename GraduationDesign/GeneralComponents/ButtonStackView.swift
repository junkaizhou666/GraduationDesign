//
//  ButtonStackView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

struct ButtonStackStruct {
    let buttons: [(image: UIImage?, buttonTitle: String)]
}

class ButtonStackView: UIView {
    var mainView: UIView!
    var titleLabel: UILabel!
    var separatorLine: UIView!
    var buttonStack: UIStackView!
    var separatorView: UIView!
    
    init(buttons: ButtonStackStruct, labelTitle: String) {
        super.init(frame: .zero)
        
        // 创建 mainView
        mainView = UIView()
        self.addSubview(mainView)
        
        // 添加标题
        titleLabel = UILabel()
        titleLabel.text = labelTitle
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .left
        mainView.addSubview(titleLabel)
        
        // 添加分割线
        separatorLine = UIView()
        separatorLine.backgroundColor = .gray
        mainView.addSubview(separatorLine)
        
        setupMainView() // 设置 mainView 布局
        
        // 创建按钮堆叠视图
        buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        self.addSubview(buttonStack)
        
        // 创建分割视图
        separatorView = UIView()
        separatorView.backgroundColor = UIColor(named: "SeperatorView")
        self.addSubview(separatorView)
        
        setupButtons(buttons: buttons) // 创建按钮行
        
        setupConstraints() // 设置布局
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMainView() {
        // 设置标题和分割线布局
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    private func setupButtons(buttons: ButtonStackStruct) {
        var currentRowStack: UIStackView?
        var buttonsInRow: [UIButton] = []
        
        for (index, (image, buttonTitle)) in buttons.buttons.prefix(12).enumerated() { // 最多12个按钮
            let button = createButton(image: image, buttonTitle: buttonTitle)
            buttonsInRow.append(button)
            
            if (index + 1) % 4 == 0 || (index + 1) == buttons.buttons.count {
                currentRowStack = createRowStack(buttons: buttonsInRow)
                buttonStack.addArrangedSubview(currentRowStack!)
                buttonsInRow.removeAll()
            }
        }
    }
    
    private func setupConstraints() {
        // mainView 的布局
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        // buttonStack 的布局
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        // sepatatorView 的布局
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(buttonStack.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    private func createButton(image: UIImage?, buttonTitle: String) -> UIButton {
        let button = UIButton(type: .custom)

        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear

        if let image = image {
            configuration.image = image
        }

        // 检查标题长度，超过 4 个字符时截断并添加省略号
        let trimmedTitle = buttonTitle.count > 4 ? String(buttonTitle.prefix(4)) + "…" : buttonTitle
        configuration.title = trimmedTitle

        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        var titleAttributes = AttributeContainer()
        titleAttributes.font = UIFont.systemFont(ofSize: 14)
        titleAttributes.foregroundColor = UIColor.black
        configuration.attributedTitle = AttributedString(trimmedTitle, attributes: titleAttributes)

        button.configuration = configuration

        // 设置按钮固定宽高，确保对齐
        button.snp.makeConstraints { make in
            //make.width.equalTo(75)
            make.height.equalTo(75)
        }

        return button
    }
    
    private func createRowStack(buttons: [UIView]) -> UIStackView {
        // 创建行 StackView
        let rowStack = UIStackView(arrangedSubviews: buttons)
        rowStack.axis = .horizontal
        rowStack.spacing = 10
        rowStack.alignment = .fill // 修改为 fill 确保子视图填充高度
        rowStack.distribution = .fillEqually // 修改为 fillEqually 确保按钮宽度均匀分布

        // 如果按钮数量不足 4 个，添加空白占位视图
        let missingButtonCount = 4 - buttons.count
        if missingButtonCount > 0 {
            for _ in 1...missingButtonCount {
                let placeholderView = UIView()
                placeholderView.backgroundColor = .clear
                rowStack.addArrangedSubview(placeholderView)
            }
        }

        // 设置每行的高度
        rowStack.snp.makeConstraints { make in
            make.height.equalTo(75) // 行高度
        }

        return rowStack
    }
}
