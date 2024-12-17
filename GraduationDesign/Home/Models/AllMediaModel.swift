//
//  AllMediaModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit

struct AllMediaStruct {
    let id: Int
    let image: UIImage?
    let title: String
}

class AllMediaModel {
    let allMediaModel = [AllMediaStruct(id: 0, image: UIImage(named: "AllMedia_1"), title: " 太暖了！轻大助你一战成“硕”"),
                         AllMediaStruct(id: 1, image: UIImage(named: "AllMedia_2"), title: "在轻大，“椅”探究竟！"),
                         AllMediaStruct(id: 2, image: UIImage(named: "AllMedia_3"), title: "10天，上岸！"),
                         AllMediaStruct(id: 3, image: UIImage(named: "AllMedia_4"), title: "加油！你也可以拥有500+!"),
                         AllMediaStruct(id: 4, image: UIImage(named: "AllMedia_5"), title: "99分、100分，快码住！轻大期末高分秘诀！"),
                         AllMediaStruct(id: 5, image: UIImage(named: "AllMedia_6"), title: "抖音：下一站，上岸！")]
}
