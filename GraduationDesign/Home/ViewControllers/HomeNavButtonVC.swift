//
//  HomeNavButtonVC.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/19.
//

import UIKit
import SnapKit

class HomeNavButtonVC: UIViewController {
    
    // 定义一个闭包类型，父控制器可以传入点击事件的处理方法
    var onNavButtonTapped: (() -> Void)?
    
    private var navDropdownMenuVC: DropdownMenuViewController!
    private var isDropdownMenuVisible = false
    private var savedNavDropdownMenuModel: [DropdownMenuStruct] = []
    private var didTapBackButton = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    private func setupButton() {
        let button = UIButton()
        button.backgroundColor = .white
        self.view.addSubview(button)

        button.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.height.equalTo(40)
        }

        let leftLabel = UILabel()
        leftLabel.text = "导航"
        leftLabel.textColor = .black
        leftLabel.textAlignment = .left
        button.addSubview(leftLabel)

        leftLabel.snp.makeConstraints { make in
            make.left.equalTo(button.snp.left).offset(10)
            make.centerY.equalTo(button.snp.centerY)
        }

        let rightLabel = UILabel()
        rightLabel.text = "更多"
        rightLabel.textColor = .black
        rightLabel.textAlignment = .right
        button.addSubview(rightLabel)

        rightLabel.snp.makeConstraints { make in
            make.right.equalTo(button.snp.right).offset(-10)
            make.centerY.equalTo(button.snp.centerY)
        }

        // 为按钮添加点击事件
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // 当按钮被点击时，调用父控制器传递的闭包
    @objc func buttonTapped() {
        onNavButtonTapped?()  // 调用闭包
    }
}
