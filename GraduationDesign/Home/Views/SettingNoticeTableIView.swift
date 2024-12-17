//
//  SettingNoticeTableIView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/12.
//

import UIKit
import SnapKit

class SettingNoticeTableIView: UIView {
    var tableView: UITableView!
    var data: [Model] = []
    
    var cellIdentifier: String {
        return String(describing: SettingNoticeCell.self)
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
        tableView.register(SettingNoticeCell.self, forCellReuseIdentifier: cellIdentifier)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(600)
        }
    }
}

extension SettingNoticeTableIView: UITableViewDelegate, UITableViewDataSource {
    func setData(_ data: [Model]) {
        self.data = data
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SettingNoticeCell
        let model = data[indexPath.row]
        cell.titleLabel.text = model.title
        let dateString = model.date
        let day = String(dateString.dropFirst(8))
        let yearMonth = String(dateString.dropLast(3))
        cell.dayLabel.text = day
        cell.yearMonthLabel.text = yearMonth
        return cell
    }
}
