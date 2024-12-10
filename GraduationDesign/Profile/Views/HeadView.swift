//
//  HeadView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class HeadView: UIView {
    var image = UIImageView()
    var nameLabel = UILabel()
    var collegeLabel = UILabel()
    var informationButton = UIButton()
    var certificateButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = UIColor(named: "NavBar")
        
        addSubview(image)
        addSubview(nameLabel)
        addSubview(collegeLabel)
        addSubview(informationButton)
        addSubview(certificateButton)
        
        image.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.image = UIImage(named: "avatar")
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(image.snp.right).offset(20)
        }
        nameLabel.text = "周俊凯"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .white
        
        collegeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(image.snp.right).offset(20)
        }
        collegeLabel.text = "软件学院"
        collegeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        collegeLabel.textColor = .white
        
        informationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalTo(certificateButton.snp.left).offset(-5)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        informationButton.setTitle("信息", for: .normal)
        informationButton.setTitleColor(.white, for: .normal)
        
        certificateButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        certificateButton.setTitle("证件", for: .normal)
        certificateButton.setTitleColor(.white, for: .normal)
    }
}
