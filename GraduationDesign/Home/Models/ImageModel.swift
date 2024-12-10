//
//  ImageModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

struct HomeImage {
    let id: Int
    let image: UIImage?
}

class ImageUpModel {
    let imagesUp = [HomeImage(id: 0, image: UIImage(named: "Home_Up_1")),
                  HomeImage(id: 1, image: UIImage(named: "Home_Up_2")),
                  HomeImage(id: 2, image: UIImage(named: "Home_Up_3")),
                  HomeImage(id: 3, image: UIImage(named: "Home_Up_4")),
                  HomeImage(id: 4, image: UIImage(named: "Home_Up_5"))]
}

//class ImageDownModel {
//    let imagesDown = [
//        HomeImage(id: 0, image: UIImage(named: "Home_Down_1")),
//        HomeImage(id: 1, image: UIImage(named: "Home_Down_2")),
//        HomeImage(id: 2, image: UIImage(named: "Home_Down_3"))
//    ]
//}
