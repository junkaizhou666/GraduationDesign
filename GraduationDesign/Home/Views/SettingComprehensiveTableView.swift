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
//        let maxTitleWidth: CGFloat = self.frame.width * 0.5
//        cell.titleLabel.text = model.title.truncated(toFitWidth: maxTitleWidth, font: cell.titleLabel.font)
        return cell
    }
}
