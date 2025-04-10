//
//  HeadViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/5.
//

import UIKit
import SnapKit
import SDWebImage

class HeadViewController: UIViewController, UINavigationControllerDelegate {
    private var avatarVC = AvatarViewController()
    var nameLabel = UILabel()
    var collegeLabel = UILabel()
    var informationButton = UIButton()
    var certificateButton = UIButton()
    var imagePickerController: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        self.view.backgroundColor = UIColor(named: "NavBar")
        
        addChild(avatarVC)
        avatarVC.view.layer.cornerRadius = 40
        avatarVC.view.clipsToBounds = true
        view.addSubview(avatarVC.view)
        avatarVC.didMove(toParent: self)

        view.addSubview(nameLabel)
        view.addSubview(collegeLabel)
        view.addSubview(informationButton)
        view.addSubview(certificateButton)
        
        avatarVC.view.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.width.height.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalTo(avatarVC.view.snp.right).offset(20)
        }
        nameLabel.text = "周俊凯"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .white
        
        collegeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalTo(avatarVC.view.snp.right).offset(20)
        }
        collegeLabel.text = "软件学院"
        collegeLabel.font = UIFont.boldSystemFont(ofSize: 16)
        collegeLabel.textColor = .white
        
        informationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.right.equalTo(certificateButton.snp.left).offset(-5)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        informationButton.setTitle("信息", for: .normal)
        informationButton.setTitleColor(.white, for: .normal)
        
        certificateButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        certificateButton.setTitle("证件", for: .normal)
        certificateButton.setTitleColor(.white, for: .normal)
    }
}
