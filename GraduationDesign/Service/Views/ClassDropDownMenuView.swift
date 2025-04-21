//
//  ClassDropDownMenu.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/21.
//

import UIKit
import SnapKit

class ClassDropDownMenuView: UIView {
    private var tableView: UITableView!
    private var isClassTableViewVisible = false
    private var tableViewHeightConstraint: Constraint?
    private var classModel = ClassNameModel().classNameModel
    private var personTableView = PersonDropDownMenuView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClassCell")
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            self.tableViewHeightConstraint = make.height.equalTo(400).constraint
        }
    }
}

extension ClassDropDownMenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)
        let classModel = classModel[indexPath.row]
        cell.textLabel?.text = classModel.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    
}
