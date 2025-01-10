//
//  NavDropdownMenuView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/25.
//

import UIKit
import SnapKit
import WebKit

class NavDropdownMenuView: UIView{
    private var tableView: UITableView!
    private var isSeparatorVisible = false
    private var tableViewHeightConstraint: Constraint?
    
    var data: [[DropdownMenuStruct]] = []
    
    init(data: [[DropdownMenuStruct]]) {
        self.data = data
        super.init(frame: .zero)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NavCell")
        tableView.backgroundColor = .blue
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            self.tableViewHeightConstraint = make.height.equalTo(400).constraint
        }
    }
    
    func toggleDropdownVisibility() {
        isSeparatorVisible.toggle()
        
        let newHeight: CGFloat = isSeparatorVisible ? 280 : 0
        tableViewHeightConstraint?.update(offset: 400 + newHeight)
        
        
        if let parentVC = self.parentViewController() as? HomeViewController {
            parentVC.imageUpPageVC.view.snp.updateConstraints { make in
                make.top.equalTo(self.snp.bottom).offset(newHeight)
            }
        }
        
        tableView.reloadData()
    }
}

extension NavDropdownMenuView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NavCell", for: indexPath)
        let sectionData = data[indexPath.section]
        let dropdownItem = sectionData[indexPath.row]
        cell.textLabel?.text = dropdownItem.title

        for subview in cell.contentView.subviews {
            if subview is UIButton {
                subview.removeFromSuperview()
            }
        }

        if indexPath.section == 1 && indexPath.row == 0 {
            let dropdownButton = UIButton(type: .system)
            dropdownButton.setTitle("▼", for: .normal)
            dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped), for: .touchUpInside)
            cell.contentView.addSubview(dropdownButton)

            dropdownButton.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-20)
            }
        }

        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @objc private func dropdownButtonTapped() {
        toggleDropdownVisibility()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 && isSeparatorVisible {
            let footerView = UIView()
            let schoolTableView = SchoolDropdownMenuView()
            footerView.addSubview(schoolTableView)
            schoolTableView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(280)
            }
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 && isSeparatorVisible ? 280 : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = data[indexPath.section][indexPath.row]
        let title = selectedItem.title
        let id = selectedItem.id
        navigateToDetailPage(id: id, title: title)
    }
    
    func navigateToDetailPage(id: Int, title: String) {
        let jumpVC = JumpToViewController()
        jumpVC.title = title
        
        switch id {
        case 0:
            jumpVC.title = "郑州轻工业大学欢迎您"
            jumpVC.urlString = "https://www.zzuli.edu.cn"
        case 1:
            jumpVC.urlString = "https://www.zzuli.edu.cn/159/list.htm"
        case 2:
            jumpVC.urlString = "https://www.zzuli.edu.cn/zzjgx202211csy/list.htm"
        case 3:
            jumpVC.urlString = "https://www.zzuli.edu.cn/269/list.htm"
        default:
            jumpVC.urlString = "https://www.zzuli.edu.cn/275/list.htm"
        }
        
        if let parentVC = self.parentViewController() {
            parentVC.navigationController?.pushViewController(jumpVC, animated: true)
        }
    }
    
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while let nextResponder = parentResponder?.next {
            if nextResponder is UIViewController {
                return nextResponder as? UIViewController
            }
            parentResponder = nextResponder
        }
        return nil
    }
}
