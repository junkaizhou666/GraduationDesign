//
//  ButtonModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

struct MessageButtonStruct {
    let buttons: [(image: UIImage?, buttonTitle: String)]
}

class ButtonModel {
    let buttonModel = MessageButtonStruct(buttons: [
        (image: UIImage(named: "icon"), buttonTitle: "周会表"),
        (image: UIImage(named: "icon"), buttonTitle: "班车查询"),
        (image: UIImage(named: "icon"), buttonTitle: "通讯指南"),
        (image: UIImage(named: "icon"), buttonTitle: "校历查询"),
    ])
}
