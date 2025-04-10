//
//  FullScreenAvatarViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit

class FullScreenAvatarViewController: UIViewController {
    
    private let avatarImageView: UIImageView

    init(image: UIImage) {
        self.avatarImageView = UIImageView(image: image)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // 设置图片为全屏
        avatarImageView.contentMode = .scaleAspectFit
        view.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        // 添加点击手势返回
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissFullScreen))
        avatarImageView.addGestureRecognizer(tapGesture)
        avatarImageView.isUserInteractionEnabled = true
    }

    @objc private func dismissFullScreen() {
        dismiss(animated: true, completion: nil)
    }
}
