//
//  SettingNoticeCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/12.
//

import UIKit
import SnapKit

class SettingNoticeCell: UITableViewCell {
    var titleLabel = UILabel()
    var dayLabel = UILabel()
    var yearMonthLabel = UILabel()
    var dateView = UIView()
    var mainView = UIView()
    
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
        
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.backgroundColor = UIColor(named: "dateView")
        mainView.addSubview(dateView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(titleLabel)
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.numberOfLines = 0
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textColor = UIColor(named: "dayLabel")
        dateView.addSubview(dayLabel)
        dayLabel.font = .systemFont(ofSize: 18)
        
        yearMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        dateView.addSubview(yearMonthLabel)
        yearMonthLabel.font = .systemFont(ofSize: 12)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        dateView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(5)
            make.width.equalTo(mainView.snp.width).multipliedBy(0.15)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        yearMonthLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom)
            make.centerX.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(dateView.snp.right).offset(5)
        }
    }
}
