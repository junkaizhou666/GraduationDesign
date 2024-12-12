//
//  ImageModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

struct HomeUpImage {
    let id: Int
    let image: UIImage?
}

class ImageUpModel {
    let imagesUp = [HomeUpImage(id: 0, image: UIImage(named: "Home_Up_1")),
                  HomeUpImage(id: 1, image: UIImage(named: "Home_Up_2")),
                  HomeUpImage(id: 2, image: UIImage(named: "Home_Up_3")),
                  HomeUpImage(id: 3, image: UIImage(named: "Home_Up_4")),
                  HomeUpImage(id: 4, image: UIImage(named: "Home_Up_5"))]
}

struct HomeBottomImage {
    let id: Int
    let title: String
    let image: UIImage?
}

class ImageBottomModel {
    let imagesBottom = [
        HomeBottomImage(id: 0, title: "学校召开2025年度国家自然科学基金项目申报动员大会", image: UIImage(named: "Home_Bottom_1")),
        HomeBottomImage(id: 1, title: "学校成功举办学习贯彻党的二十届三中全会精神暨“中国式现代化的重大理论与实践问题研究”学术研讨会", image: UIImage(named: "Home_Bottom_2")),
        HomeBottomImage(id: 2, title: "学校科技创新新突破", image: UIImage(named: "Home_Bottom_3"))
    ]
}
