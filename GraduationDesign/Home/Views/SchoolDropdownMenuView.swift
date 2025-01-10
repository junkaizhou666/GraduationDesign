//
//  SchoolDropdownMenuView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2024/12/24.
//

import UIKit
import SnapKit

class SchoolDropdownMenuView: UIView {
    private var schoolDropdownMenuModel = SchoolDropdownMenuModel().schoolModel
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(280)
        }
    }
}

extension SchoolDropdownMenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolDropdownMenuModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let schoolTableModel = schoolDropdownMenuModel[indexPath.row]
        cell.textLabel?.text = schoolTableModel.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = schoolDropdownMenuModel[indexPath.row]
        let title = selectedItem.title
        let id = selectedItem.id
        navigateToDetailPage(id: id, title: title)
    }
    
    func navigateToDetailPage(id: Int, title: String) {
        let detailVC = UIViewController()
        detailVC.view.backgroundColor = .white
        detailVC.title = title
        
        switch id {
        case 0:
            detailVC.view.backgroundColor = .blue
        case 1:
            detailVC.view.backgroundColor = .green
        case 2:
            detailVC.view.backgroundColor = .yellow
        case 3:
            detailVC.view.backgroundColor = .red
        default:
            detailVC.view.backgroundColor = .white
        }
        
        if let parentVC = self.parentViewController() {
            parentVC.navigationController?.pushViewController(detailVC, animated: true)
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
