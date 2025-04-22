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

struct DisplayNode {
    let item: DisplayItem
    let level: Int
}

class ContactListViewController: UIViewController {

    private let tableView = UITableView()
    private var dataSource: [DisplayNode] = []
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
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "PersonCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
    }

    private func loadInitialData() {
        dataSource = collegeModel.map { DisplayNode(item: .college($0), level: 0) }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let node = dataSource[indexPath.row]
        let item = node.item
        let level = node.level

        switch item {
        case .college(let model), .grade(let model), .class(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
            var indent = ""
            for _ in 0..<level {
                indent += "    "
            }
            cell.textLabel?.text = "\(indent)\(model.title)"
            cell.accessoryType = .disclosureIndicator
            return cell

        case .person(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let node = dataSource[indexPath.row]
        let item = node.item
        let level = node.level

        if expandedIndexSet.contains(indexPath.row) {
            collapseSubitems(from: indexPath.row)
            return
        }

        var subitems: [DisplayNode] = []

        switch item {
        case .college:
            subitems = gradeModel.map { DisplayNode(item: .grade($0), level: level + 1) }
        case .grade:
            subitems = classModel.map { DisplayNode(item: .class($0), level: level + 1) }
        case .class:
            subitems = personModel.map { DisplayNode(item: .person($0), level: level + 1) }
        case .person:
            return
        }

        insertSubitems(at: indexPath.row, nodes: subitems)
    }

    private func insertSubitems(at index: Int, nodes: [DisplayNode]) {
        dataSource.insert(contentsOf: nodes, at: index + 1)
        expandedIndexSet.insert(index)
        tableView.reloadData()
    }

    private func collapseSubitems(from index: Int) {
        let parentLevel = dataSource[index].level
        var removeRange = index + 1

        while removeRange < dataSource.count {
            if dataSource[removeRange].level <= parentLevel {
                break
            }
            removeRange += 1
        }

        let removingIndices = (index + 1)..<removeRange
        for i in removingIndices {
            expandedIndexSet.remove(i)
        }

        dataSource.removeSubrange(index + 1..<removeRange)
        expandedIndexSet.remove(index)
        tableView.reloadData()
    }
}
