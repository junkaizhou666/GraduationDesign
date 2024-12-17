//
//  SettingScienceCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/16.
//

import UIKit
import SnapKit

class SettingScienceCell: UITableViewCell {
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var upTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var bottomTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainView)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(image)
        
        upTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(upTitle)
        
        bottomTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(bottomTitle)
        
        // 设置 bottomTitle 行间距和首行缩进
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        paragraphStyle.firstLineHeadIndent = 24
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.gray
        ]
        
        // 确保 text 非空后再设置 attributedText
        if let text = bottomTitle.text, !text.isEmpty {
            bottomTitle.attributedText = NSAttributedString(string: text, attributes: attributes)
        } else {
            // 如果没有 text，可以直接设置一个默认值
            bottomTitle.attributedText = NSAttributedString(string: "默认文本", attributes: attributes)
        }
        bottomTitle.layoutIfNeeded()

        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        image.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
        
        upTitle.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom)
            make.left.equalTo(mainView.snp.left)
            make.width.equalTo(mainView.snp.width).multipliedBy(0.99)
        }
        
        bottomTitle.snp.makeConstraints { make in
            make.top.equalTo(upTitle.snp.bottom).offset(10)
            make.left.equalTo(mainView.snp.left)
            make.width.equalTo(mainView.snp.width).multipliedBy(0.99)
            make.bottom.equalTo(mainView.snp.bottom).offset(-5)
        }
    }
}
