//
//  HomeNavButtonView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/26.
//

import UIKit
import SnapKit

class HomeNavButtonView: UIView {
    private var mainButton: UIButton
    private var leftLabel: UILabel
    private var rightLabel: UILabel
    var onButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        mainButton = UIButton()
        leftLabel = UILabel()
        rightLabel = UILabel()
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        mainButton = UIButton()
        leftLabel = UILabel()
        rightLabel = UILabel()
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        // 设置按钮
        mainButton.backgroundColor = .white
        addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(40)
        }
        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        
        // 设置左边标签
        leftLabel.text = "导航"
        leftLabel.textColor = .black
        leftLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.right.equalTo(mainButton.snp.left).offset(-10)
        }
        
        // 设置右边标签
        rightLabel.text = "更多"
        rightLabel.textColor = .black
        rightLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(rightLabel)
        rightLabel.snp.makeConstraints { make in
            make.centerY.equalTo(mainButton)
            make.left.equalTo(mainButton.snp.right).offset(10)
        }
        
        // 给左边标签和右边标签添加点击手势
        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(mainButtonTapped))
        leftLabel.isUserInteractionEnabled = true
        leftLabel.addGestureRecognizer(leftTapGesture)
        
        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(mainButtonTapped))
        rightLabel.isUserInteractionEnabled = true
        rightLabel.addGestureRecognizer(rightTapGesture)
    }
    
    @objc private func mainButtonTapped() {
        onButtonTapped?()
    }
    
    func getButton() -> UIButton {
        return mainButton
    }
}
