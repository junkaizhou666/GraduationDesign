//
//  SettingComprehensiveTableView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/11.
//

import UIKit
import SnapKit

class SettingComprehensiveTableView: UIView {
    var tableView: UITableView!
    var data: [Model] = []
    
    var cellIdentifier: String {
        return String(describing: SettingComprehensiveCell.self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingComprehensiveCell.self, forCellReuseIdentifier: cellIdentifier)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(600)
        }
    }
}

extension SettingComprehensiveTableView: UITableViewDelegate, UITableViewDataSource {
    func setData(_ data: [Model]) {
        self.data = data
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SettingComprehensiveCell
        let model = data[indexPath.row]
        let dateString = model.date
        let monthAndDay = String(dateString.dropFirst(5))
        cell.dateLabel.text = monthAndDay
        cell.titleLabel.text = model.title
        return cell
    }
    
    // 点击cell时跳转到JumpToViewController
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 获取选中的model
            let model = data[indexPath.row]
            
            // 根据model.id决定跳转的URL
            var urlString: String?
            switch model.id {
            case 0:
                urlString = "https://www.zzuli.edu.cn/2025/0109/c280a327114/page.htm"
            case 1:
                urlString = "http://www.zzuli.edu.cn/_t2404/2025/0109/c303a327109/page.htm"
            default:
                break
            }
            
            // 如果URL有效，则跳转到JumpToViewController
            if let urlString = urlString {
                let jumpVC = JumpToViewController()
                jumpVC.urlString = urlString
                // 获取当前ViewController
                if let viewController = self.parentViewController {
                    viewController.navigationController?.pushViewController(jumpVC, animated: true)
                }
            }
        }
}
