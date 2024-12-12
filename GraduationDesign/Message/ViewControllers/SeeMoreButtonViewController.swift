//
//  SeeMoreButtonViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/9.
//

import UIKit

class SeeMoreButtonViewController: UIViewController {
    private var settingTableView: SettingMessageTableView = SettingMessageTableView()
    private var customNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTable()
    }
    
    private func setupTable() {
        view.addSubview(settingTableView)
        settingTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.equalToSuperview()
        }
        
        let model = NoticeModel()
        settingTableView.setData(model.noticeModel)
        
        settingTableView.tableView.delegate = self
        settingTableView.tableView.dataSource = self
        settingTableView.tableView.reloadData()
    }
}


extension SeeMoreButtonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTableView.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.tableView.dequeueReusableCell(withIdentifier: settingTableView.cellIdentifier, for: indexPath) as! SettingMessageCell
        let model = settingTableView.data[indexPath.row]
        cell.titleLabel.text = model.title
        cell.dateLabel.text = model.date
        return cell
    }
}
