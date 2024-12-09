//
//  SettingCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import Foundation
import UIKit
import SnapKit

class SettingCell: UITableViewCell {
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var mainView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubViews()
    }
    
    private func setupSubViews() {
        contentView.addSubview(mainView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(titleLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(dateLabel)
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 8)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.lessThanOrEqualToSuperview().offset(-10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.right.lessThanOrEqualToSuperview().offset(-10)
        }
    }
}
