//
//  SettingAllMediaCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class SettingAllMediaCell: UITableViewCell {
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
        contentView.addSubview(image)
        contentView.addSubview(title)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // image 的约束
        image.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(150)  // 确保 image 的高度明确设置
        }
        
        // title 的约束
        title.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(5)
            make.left.equalTo(image.snp.left)
            make.right.equalTo(contentView).offset(-15)  // 为 title 添加右边距，避免溢出
            make.bottom.equalTo(contentView).offset(-10)  // 为 title 添加底边距
        }
    }

}
