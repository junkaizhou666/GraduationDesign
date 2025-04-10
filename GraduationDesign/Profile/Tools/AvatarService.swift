//
//  AvatarService.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/9.
//

import UIKit

class AvatarService {
    private let uploadURL = URL(string: "http://62.234.153.165:9091/admin/system/upload")!
    
    // 用于保存上传后的头像 URL
    private var avatarImageURL: String?

    // 上传头像
    func uploadAvatar(image: UIImage, completion: @escaping (Bool) -> Void) {
        var request = URLRequest(url: uploadURL)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let imageData = image.jpegData(compressionQuality: 0.8) ?? Data()
        var body = Data()
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"avatar.jpg\"\r\n")
        body.append("Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n")

        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            // 解析服务器返回的 JSON
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let url = json["data"] as? String {
                // 保存头像的 URL
                self.avatarImageURL = url
                print("头像上传成功，返回 URL: \(url)")
                completion(true)
            } else {
                print("上传失败，未返回头像 URL")
                completion(false)
            }
        }.resume()
    }

    // 获取头像图片
    func fetchAvatarImage(completion: @escaping (UIImage?) -> Void) {
        guard let avatarURL = avatarImageURL, let url = URL(string: avatarURL) else {
            print("没有找到头像 URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("加载头像失败，错误：\(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("无法转换为图片")
                completion(nil)
                return
            }

            print("成功加载头像")
            completion(image)
        }.resume()
    }
}
