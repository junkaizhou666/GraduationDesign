//
//  ExaminationViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class ExaminationViewController: UIViewController {
    var collectionView: UICollectionView!
    
    let buttonData = CollectionButtonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 collectionView 布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 165, height: 120)  // 每个按钮的大小
        layout.minimumLineSpacing = 20  // 行间距
        layout.minimumInteritemSpacing = 10  // 列间距
        layout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)  // 边距
        
        // 创建 UICollectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "TalentTableBG")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingExaminationCell.self, forCellWithReuseIdentifier: "examinationCell")
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ExaminationViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "examinationCell", for: indexPath) as! SettingExaminationCell
        let model = buttonData.buttonModel[indexPath.row]
        cell.configureExaminationCell(backgroundColor: model.backgroundColor ?? .white, title: model.title)
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = buttonData.buttonModel[indexPath.item]
        print("\(model.title) tapped")
    }
}
