//
//  SettingJXTitleCell.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/27.
//

import UIKit
import JXSegmentedView

class SettingJXTitleCell: JXSegmentedTitleCell {
    override func reloadData(itemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType) {
        super.reloadData(itemModel: itemModel, selectedType: selectedType)
        
        // 类型检查并设置背景颜色
        guard let model = itemModel as? TitleItemModel else { return }
        backgroundColor = model.isSelected ? model.selectedBackgroundColor : model.normalBackgroundColor
    }
}

