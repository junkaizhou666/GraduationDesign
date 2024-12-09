//
//  ImageModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

struct HomeImage {
    let id: Int
    let image: String
}

class ImageModel {
    let images = [HomeImage(id: 0, image: "image1"),
                  HomeImage(id: 1, image: "image2"),
                  HomeImage(id: 2, image: "image3"),
                  HomeImage(id: 3, image: "image4"),
                  HomeImage(id: 4, image: "image5")]
}
