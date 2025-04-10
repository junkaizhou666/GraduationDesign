//
//  AvatarPresenter.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit

class AvatarPresenter: NSObject {
    private weak var view: AvatarViewProtocol?
    private let service = AvatarService()
    
    init(view: AvatarViewProtocol) {
        self.view = view
    }

    func didTapViewAvatar() {
        // 从服务器获取原图并展示
        service.fetchAvatarImage { [weak self] image in
            DispatchQueue.main.async {
                if let image = image {
                    self?.view?.showFullScreenAvatar(image: image)  // 显示全屏头像
                } else {
                    self?.view?.showError("加载头像失败")
                }
            }
        }
    }

    func didTapChooseFromAlbum(vc: UIViewController) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        vc.present(picker, animated: true)
    }
}

extension AvatarPresenter: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            view?.showError("图片选择失败")
            return
        }

        // 展示图片
        view?.showAvatar(image: image)
        
        // 上传图片
        service.uploadAvatar(image: image) { [weak self] success in
            if !success {
                DispatchQueue.main.async {
                    self?.view?.showError("上传失败")
                }
            }
        }
    }
}
