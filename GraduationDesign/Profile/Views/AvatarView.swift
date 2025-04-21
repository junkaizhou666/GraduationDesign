//
//  AvatarViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit
import SnapKit

protocol AvatarViewDelegate: AnyObject {
    func avatarViewDidTapViewAvatar()
    func avatarViewDidTapChooseFromAlbum()
}

class AvatarView: UIView {
    
    weak var delegate: AvatarViewDelegate?

    private lazy var avatarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .white
        addSubview(avatarButton)
        avatarButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc private func showActionSheet() {
        guard let vc = self.findViewController() else { return }
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "查看头像", style: .default) { _ in
            self.delegate?.avatarViewDidTapViewAvatar()
        })
        sheet.addAction(UIAlertAction(title: "从相册选择", style: .default) { _ in
            self.delegate?.avatarViewDidTapChooseFromAlbum()
        })
        sheet.addAction(UIAlertAction(title: "取消", style: .cancel))
        vc.present(sheet, animated: true)
    }

    func updateAvatar(image: UIImage) {
        avatarButton.setImage(image, for: .normal)
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let vc = responder as? UIViewController {
                return vc
            }
            responder = responder?.next
        }
        return nil
    }
}
