//
//  ComprehensiveTableVC.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/11.
//

import UIKit

class ComprehensiveTableVC: UIViewController {
    var tableView: SettingMessageTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView = SettingMessageTableView(frame: CGRect.zero)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(340)
        }
        
        let model = NoticeModel()
        tableView.setData(model.noticeModel)
    }
}
