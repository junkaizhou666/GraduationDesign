//
//  SettingTabView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class SettingTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var data: [Model] = []
    
    var cellIdentifier: String {
        return String(describing: SettingCell.self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingCell.self, forCellReuseIdentifier: cellIdentifier)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(600)
        }
    }
    
    // 设置数据源
    func setData(_ data: [Model]) {
        self.data = data
        tableView.reloadData()
    }
    
    // UITableViewDataSource 方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SettingCell
        let model = data[indexPath.row]
        cell.titleLabel.text = model.title
        cell.dateLabel.text = model.date
        return cell
    }
    
    // UITableViewDelegate 方法（如果需要）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 可以添加点击事件处理
    }
}
