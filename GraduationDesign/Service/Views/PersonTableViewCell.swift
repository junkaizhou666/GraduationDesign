//
//  PersonTableViewCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    let avatarImageView = UIImageView()
    let nameLabel = UILabel()
    let detailLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)

        avatarImageView.layer.cornerRadius = 20
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill

        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)

        detailLabel.font = UIFont.systemFont(ofSize: 13)
        detailLabel.textColor = .lightGray

        avatarImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.top)
            make.left.equalTo(avatarImageView.snp.right).offset(12)
            make.right.equalToSuperview().offset(-16)
        }

        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.equalTo(nameLabel)
            make.right.equalTo(nameLabel)
            make.bottom.lessThanOrEqualToSuperview().offset(-8)
        }
    }

    func configure(with model: PersonModelStruct) {
        nameLabel.text = model.name
        detailLabel.text = "\(model.position ?? "普通学生") | \(model.number)"
        avatarImageView.image = model.avater
    }
}
