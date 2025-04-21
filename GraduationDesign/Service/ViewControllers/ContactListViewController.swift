//
//  ContactListViewController.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/21.
//

import UIKit
import SnapKit

enum DisplayItem {
    case college(NameModelStruct)
    case grade(NameModelStruct)
    case `class`(NameModelStruct)
    case person(PersonModelStruct)
}

class ContactListViewController: UIViewController {
    
    private let tableView = UITableView()
    private var dataSource: [DisplayItem] = []
    private var expandedIndexSet: Set<Int> = []

    private let collegeModel = CollegeNameModel().collegeNameModel
    private let gradeModel = GradeNameModel().gradeNameModel
    private let classModel = ClassNameModel().classNameModel
    private let personModel = PersonModel().personModel

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "联系人分组"
        setupTableView()
        loadInitialData()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
    }

    private func loadInitialData() {
        dataSource = collegeModel.map { .college($0) }
        tableView.reloadData()
    }
}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = dataSource[indexPath.row]
        cell.imageView?.image = nil
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = nil

        switch item {
        case .college(let model), .grade(let model), .class(let model):
            cell.textLabel?.text = model.title
            cell.accessoryType = .disclosureIndicator
        case .person(let model):
            cell.textLabel?.text = "           \(model.name)"
            cell.detailTextLabel?.text = "\(model.position ?? "成员") | \(model.number)"
            cell.imageView?.image = model.avater
            cell.accessoryType = .none
        }
        return cell
    }
}

extension ContactListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource[indexPath.row]

        // 防止重复展开
        if expandedIndexSet.contains(indexPath.row) {
            collapseSubitems(from: indexPath.row)
            return
        }

        switch item {
        case .college:
            insertSubitems(at: indexPath.row, items: gradeModel.map { .grade($0) })
        case .grade:
            insertSubitems(at: indexPath.row, items: classModel.map { .class($0) })
        case .class:
            insertSubitems(at: indexPath.row, items: personModel.map { .person($0) })
        case .person:
            break
        }
    }

    private func insertSubitems(at index: Int, items: [DisplayItem]) {
        dataSource.insert(contentsOf: items, at: index + 1)
        expandedIndexSet.insert(index)
        tableView.reloadData()
    }

    private func collapseSubitems(from index: Int) {
        var deleteCount = 0
        var i = index + 1
        while i < dataSource.count {
            switch dataSource[i] {
            case .college:
                break
            case .grade, .class, .person:
                deleteCount += 1
                i += 1
            }
        }
        if deleteCount > 0 {
            dataSource.removeSubrange((index + 1)...(index + deleteCount))
            expandedIndexSet.remove(index)
            tableView.reloadData()
        }
    }
}
