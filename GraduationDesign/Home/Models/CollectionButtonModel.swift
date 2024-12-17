//
//  ButtonModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit

struct CollectionButtonStruct {
    let title: String
    let backgroundColor: UIColor?
}

class CollectionButtonModel {
    let buttonModel = [CollectionButtonStruct(title: "高招录取查询", backgroundColor: UIColor(named: "Button_left_1")),
                       CollectionButtonStruct(title: "本科生招生计划", backgroundColor: UIColor(named: "Button_left_2")),
                       CollectionButtonStruct(title: "本科生招生", backgroundColor: UIColor(named: "Button_left_3")),
                       CollectionButtonStruct(title: "往年高招情况", backgroundColor: UIColor(named: "Button_right_1")),
                       CollectionButtonStruct(title: "在线咨询", backgroundColor: UIColor(named: "Button_right_2")),
                       CollectionButtonStruct(title: "研究生招生", backgroundColor: UIColor(named: "Button_right_3"))]
}
