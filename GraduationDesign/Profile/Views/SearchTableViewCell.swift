//
//  SearchTableViewCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/4.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
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
        contentView.addSubview(mainView)
        mainView.addSubview(image)
        mainView.addSubview(title)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }

        title.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(8)
            make.centerY.equalTo(image)
            make.right.lessThanOrEqualToSuperview().offset(-16)
        }
    }

}
