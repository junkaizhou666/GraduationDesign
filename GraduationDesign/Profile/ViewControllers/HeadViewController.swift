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
    private var avatarView = AvatarView()
    private lazy var presenter = AvatarPresenter(view: self)
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
        
        avatarView.delegate = self
        avatarView.layer.cornerRadius = 40
        avatarView.clipsToBounds = true
        view.addSubview(avatarView)
        view.addSubview(nameLabel)
        view.addSubview(collegeLabel)
        view.addSubview(informationButton)
        view.addSubview(certificateButton)
        
        avatarView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.width.height.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalTo(avatarView.snp.right).offset(20)
        }
        nameLabel.text = "周俊凯"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = .white
        
        collegeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalTo(avatarView.snp.right).offset(20)
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

extension HeadViewController: AvatarViewDelegate {
    func avatarViewDidTapViewAvatar() {
        presenter.didTapViewAvatar()
    }

    func avatarViewDidTapChooseFromAlbum() {
        presenter.didTapChooseFromAlbum(vc: self)
    }
}

extension HeadViewController: AvatarViewProtocol {
    func showAvatar(image: UIImage) {
        avatarView.updateAvatar(image: image)
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "错误", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default))
        present(alert, animated: true)
    }

    func showFullScreenAvatar(image: UIImage) {
        let fullScreenView = FullScreenAvatarView(image: image)
        fullScreenView.frame = UIScreen.main.bounds
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            window.addSubview(fullScreenView)
        }
    }

}
