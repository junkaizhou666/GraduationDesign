//
//  SettingAllMediaTableView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/17.
//

import UIKit
import SnapKit

class SettingAllMediaTableView: UIView {
    var tableView: UITableView!
    var data: [AllMediaStruct] = []
    
    var cellIndentifier: String {
        return String(describing: SettingAllMediaCell.self)
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
        tableView.register(SettingAllMediaCell.self, forCellReuseIdentifier: cellIndentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
            //make.height.equalTo(1000)
        }
    }
}

extension SettingAllMediaTableView: UITableViewDelegate, UITableViewDataSource {
    func setData(_ data: [AllMediaStruct]) {
        self.data = data
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! SettingAllMediaCell
        let model = data[indexPath.row]
        cell.image.image = model.image
        cell.title.text = model.title
        return cell
    }
}
