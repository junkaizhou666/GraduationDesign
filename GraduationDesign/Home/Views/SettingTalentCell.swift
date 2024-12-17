//
//  SettingTalentCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class SettingTalentCell: UITableViewCell {
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var mainView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        contentView.backgroundColor = UIColor(named: "TalentTableBG")
        mainView.backgroundColor = UIColor(named: "TalentTableBG")
        contentView.addSubview(mainView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(titleLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(dateLabel)
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 15)
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(mainView.snp.width).multipliedBy(0.85)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
