//
//  FullScreenAvatarViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit
import SnapKit

class FullScreenAvatarView: UIView {
    
    private let avatarImageView: UIImageView = UIImageView()

    init(image: UIImage) {
        super.init(frame: .zero)
        self.backgroundColor = .black
        
        avatarImageView.image = image
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.isUserInteractionEnabled = true
        
        addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        avatarImageView.addGestureRecognizer(tapGesture)
    }

    @objc func dismissView() {
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
