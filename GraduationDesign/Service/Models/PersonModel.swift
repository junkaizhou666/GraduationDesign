//
//  PersonModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/19.
//

import UIKit

struct PersonModelStruct {
    let id: Int
    let name: String
    let number: Int
    let position: String?
    let avater: UIImage?
}

class PersonModel {
    let personModel = [PersonModelStruct(id: 0, name: "陈昱宏", number: 18237113899, position: "班长", avater: UIImage(named: "icon")),
                       PersonModelStruct(id: 1, name: "吴志鹏", number: 13083660692, position: "副班长", avater: UIImage(named: "icon")),
                       PersonModelStruct(id: 2, name: "杨树林", number: 18637135027, position: "学习委员", avater: UIImage(named: "icon")),
                       PersonModelStruct(id: 3, name: "任思钊", number: 18864400985, position: "体育委员", avater: UIImage(named: "icon")),
                       PersonModelStruct(id: 4, name: "马翔翔", number: 13223722790, position: "心理委员", avater: UIImage(named: "icon")),
                       PersonModelStruct(id: 5, name: "周俊凯", number: 18237113899, position: nil, avater: UIImage(named: "icon")),
                       PersonModelStruct(id: 6, name: "李昊璋", number: 18237113899, position: nil, avater: UIImage(named: "icon"))
    ]
}
