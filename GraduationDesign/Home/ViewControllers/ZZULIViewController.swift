//
//  ZZULIViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class ZZULIViewController: UIViewController {
    var collectionView: UICollectionView!
    
    let buttonData = ZZULIModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 75)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingZZULICell.self, forCellWithReuseIdentifier: "ZZULICell")
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ZZULIViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZULICell", for: indexPath) as! SettingZZULICell
        let model = buttonData.zzuliModel[indexPath.row]
        cell.configZZULICell(image: (model.image!))
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = buttonData.zzuliModel[indexPath.item]
        print("\(model.id) tapped")
    }
}
