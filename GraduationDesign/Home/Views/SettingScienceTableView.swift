//
//  SettingScienceTableView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/16.
//

import UIKit
import SnapKit

class SettingScienceTableView: UIView {
    var tableView: UITableView!
    var data: [ScienceStruct] = []
    
    var cellIdentifier: String {
        return String(describing: SettingScienceCell.self)
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
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 600

        tableView.register(SettingScienceCell.self, forCellReuseIdentifier: cellIdentifier)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(2400)
        }
    }
}

extension SettingScienceTableView: UITableViewDelegate, UITableViewDataSource {
    func setData(_ data: [ScienceStruct]) {
        self.data = data
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SettingScienceCell
        let model = data[indexPath.row]
        cell.image.image = model.image
        cell.upTitle.text = model.upTitle
        cell.bottomTitle.text = model.bottomTitle
        return cell
    }
}
