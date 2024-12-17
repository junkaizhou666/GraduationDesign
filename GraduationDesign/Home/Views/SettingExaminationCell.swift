//
//  SettingExaminationCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class SettingExaminationCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func configureExaminationCell(backgroundColor: UIColor, title: String) {
        self.contentView.backgroundColor = backgroundColor
        titleLabel.text = title
    }
}
