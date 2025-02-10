//
//  SettingTabView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit
import SnapKit

class SettingMessageTableView: UIView {
    
    var tableView: UITableView!
    var data: [Model] = []
    
    var cellIdentifier: String {
        return String(describing: SettingMessageCell.self)
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
        tableView.register(SettingMessageCell.self, forCellReuseIdentifier: cellIdentifier)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(600)
        }
    }
    
    public func reloadData() {
        tableView.reloadData()
    }
}

extension SettingMessageTableView: UITableViewDelegate, UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SettingMessageCell
        let model = data[indexPath.row]
        cell.titleLabel.text = model.title
//        let maxTitleWidth: CGFloat = tableView.frame.width * 0.5
//        cell.titleLabel.text = model.title.truncated(toFitWidth: maxTitleWidth, font: cell.titleLabel.font)

        cell.dateLabel.text = model.date
        return cell
    }
    
    // UITableViewDelegate 方法（如果需要）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 可以添加点击事件处理
    }
}
