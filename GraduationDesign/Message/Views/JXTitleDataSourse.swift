//
//  JXTitleDataSourse.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/27.
//

import UIKit
import JXSegmentedView

class JXTitleDataSourse: JXSegmentedTitleDataSource {
    var normalBackgroundColor: UIColor = .white
    var selectedBackgroundColor: UIColor = .red
    
    override func registerCellClass(in segmentedView: JXSegmentedView) {
        segmentedView.collectionView.register(SettingJXTitleCell.self, forCellWithReuseIdentifier: "JXTitleCell")
    }
    
    override func segmentedView(_ segmentedView: JXSegmentedView, cellForItemAt index: Int) -> JXSegmentedBaseCell {
        let cell = segmentedView.collectionView.dequeueReusableCell(
            withReuseIdentifier: "JXTitleCell",
            for: IndexPath(item: index, section: 0)
        ) as! SettingJXTitleCell
        return cell
    }

    // 手动更新每个 TitleItemModel 的背景颜色
    func updateItemModelBackgroundColor() {
        dataSource.enumerated().forEach { index, item in
            if let model = item as? TitleItemModel {
                model.normalBackgroundColor = normalBackgroundColor
                model.selectedBackgroundColor = selectedBackgroundColor
            }
        }
    }
}


