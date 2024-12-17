//
//  SettingZZULICell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class SettingZZULICell: UICollectionViewCell {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configZZULICell(image: UIImage) {
        imageView.image = image
    }
}
