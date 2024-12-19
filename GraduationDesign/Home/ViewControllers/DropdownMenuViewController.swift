//
//  DropdownMenuViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/18.
//

import UIKit
import SnapKit

class DropdownMenuViewController: UIViewController {
    var navTableView: UITableView!
    var navDropdownMenuModel: [DropdownMenuStruct] = []
    var schoolDropdownMenuModel: [DropdownMenuStruct] = []
    var onItemSelected: ((DropdownMenuStruct) -> Void)?
    var schoolDropdownMenu: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let schoolMenuModel = SchoolDropdownMenuModel()
        schoolDropdownMenuModel = schoolMenuModel.schoolModel
        
        navTableView = UITableView()
        navTableView.delegate = self
        navTableView.dataSource = self
        navTableView.register(UITableViewCell.self, forCellReuseIdentifier: "NavCell")
        view.addSubview(navTableView)
        
        navTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // 显示下拉菜单
    private func showSchoolDropdownMenu(from cell: UITableViewCell) {
        if schoolDropdownMenu == nil {
            schoolDropdownMenu = UIView()
            schoolDropdownMenu?.backgroundColor = UIColor(white: 0.9, alpha: 1)
            view.addSubview(schoolDropdownMenu!)
            
            let schoolDropdownTableView = UITableView()
            schoolDropdownTableView.delegate = self
            schoolDropdownTableView.dataSource = self
            schoolDropdownTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SchoolCell")
            schoolDropdownMenu?.addSubview(schoolDropdownTableView)
            
            schoolDropdownTableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        // 设置学校下拉菜单的位置
        schoolDropdownMenu?.snp.makeConstraints { make in
            make.top.equalTo(cell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.navTableView.layoutIfNeeded()
        }
    }
    
    // 隐藏下拉菜单
    private func hideDropdownMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.schoolDropdownMenu?.alpha = 0
        }) { _ in
            self.schoolDropdownMenu?.removeFromSuperview()
            self.schoolDropdownMenu = nil
        }
    }
}

extension DropdownMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func reloadMenu() {
        navTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.superview == schoolDropdownMenu {
            return schoolDropdownMenuModel.count
        } else {
            return navDropdownMenuModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if tableView.superview == schoolDropdownMenu {
            // 学校下拉菜单
            cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath)
            if indexPath.row < schoolDropdownMenuModel.count {
                let schoolMenuItem = schoolDropdownMenuModel[indexPath.row]
                cell.textLabel?.text = schoolMenuItem.title
            } else {
                print("Index out of range! indexPath.row: \(indexPath.row) schoolDropdownMenuModel.count: \(schoolDropdownMenuModel.count)")
            }
        } else {
            // 主菜单
            cell = tableView.dequeueReusableCell(withIdentifier: "NavCell", for: indexPath)
            let navTableModel = navDropdownMenuModel[indexPath.row]
            cell.textLabel?.text = navTableModel.title
            
            if navTableModel.title == "学校概况" {
                let schoolDropdownButton = UIButton(type: .system)
                schoolDropdownButton.setTitle("▼", for: .normal)
                schoolDropdownButton.addTarget(self, action: #selector(schoolDropdownButtonTapped(_:)), for: .touchUpInside)
                schoolDropdownButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                cell.accessoryView = schoolDropdownButton
            } else {
                cell.accessoryView = nil
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = navDropdownMenuModel[indexPath.row]
        onItemSelected?(selectedItem)
    }
    
    @objc func schoolDropdownButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview as? UITableViewCell else { return }
        print("Dropdown button tapped")
        // 如果下拉菜单已显示，隐藏它；否则，显示它
        if schoolDropdownMenu?.superview != nil {
            hideDropdownMenu()
        } else {
            showSchoolDropdownMenu(from: cell)
        }
    }
}
