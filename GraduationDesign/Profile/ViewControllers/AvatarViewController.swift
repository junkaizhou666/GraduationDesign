//
//  AvatarViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit
import SnapKit

class AvatarViewController: UIViewController, AvatarViewProtocol {
    
    private lazy var avatarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        return button
    }()
    
    private lazy var presenter = AvatarPresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(avatarButton)
        avatarButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(120)
        }
    }

    @objc private func showActionSheet() {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "查看头像", style: .default) { _ in
//            self.presenter.didTapViewAvatar()
        })
        sheet.addAction(UIAlertAction(title: "从相册选择", style: .default) { _ in
            self.presenter.didTapChooseFromAlbum(vc: self)
        })
        sheet.addAction(UIAlertAction(title: "取消", style: .cancel))
        present(sheet, animated: true)
    }

    // MARK: - AvatarViewProtocol

    func showAvatar(image: UIImage) {
        avatarButton.setImage(image, for: .normal)
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "错误", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default))
        present(alert, animated: true)
    }

    // 新增：展示全屏查看头像 VC
    func showFullScreenAvatar(image: UIImage) {
        let fullScreenVC = FullScreenAvatarViewController(image: image)
        fullScreenVC.modalPresentationStyle = .fullScreen
        present(fullScreenVC, animated: true)
    }
    
}
