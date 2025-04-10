//
//  ImageModel.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/5.
//

import Foundation

class ProfileImageModel {
    static let shared = ProfileImageModel()
    
    // 获取头像的URL
    func fetchImageURL(completion: @escaping (String?, Error?) -> Void) {
        let url = URL(string: "http://62.234.153.165:9091/admin/system/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            // 假设返回的数据是URL
            if let data = data, let imageUrlString = String(data: data, encoding: .utf8) {
                completion(imageUrlString, nil)
            } else {
                completion(nil, NSError(domain: "ImageModel", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
            }
        }
        task.resume()
    }
    
    // 上传图片
    func uploadImage(imageData: Data, completion: @escaping (Bool, Error?) -> Void) {
        let url = URL(string: "http://62.234.153.165:9091/admin/system/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 假设上传的请求体为图片数据
        request.httpBody = imageData
        
        let task = URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
        task.resume()
    }
}
