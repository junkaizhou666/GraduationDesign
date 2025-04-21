//
//  GradeDropDownMenuView.swift
//  GraduationDesign
//
//  Created by 周俊凯 on 2025/4/20.
//

import UIKit
import SnapKit

class GradeDropDownMenuView: UIView {
    private var tableView: UITableView!
    private var gradeModel = GradeNameModel().gradeNameModel
    private var expandedIndexPath: IndexPath?
    private let classDropDownView = ClassDropDownMenuView()

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
        tableView.separatorInset = .zero
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GradeCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ClassDropDownCell")
        addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension GradeDropDownMenuView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeModel.count + (expandedIndexPath != nil ? 1 : 0)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let expanded = expandedIndexPath, indexPath.row == expanded.row + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClassDropDownCell", for: indexPath)
            cell.selectionStyle = .none

            // 清除旧视图
            cell.contentView.subviews.forEach { $0.removeFromSuperview() }

            // 添加下一级菜单视图
            cell.contentView.addSubview(classDropDownView)
            classDropDownView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(400)
            }

            return cell
        }

        // 计算真实行数
        var actualRow = indexPath.row
        if let expanded = expandedIndexPath, indexPath.row > expanded.row {
            actualRow -= 1
        }

        let model = gradeModel[actualRow]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradeCell", for: indexPath)
        cell.textLabel?.text = model.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let expanded = expandedIndexPath, indexPath.row == expanded.row + 1 {
            return // 点击的是展开的下拉区域
        }

        tableView.beginUpdates()

        if let expanded = expandedIndexPath {
            if expanded.row == indexPath.row {
                // 收起
                expandedIndexPath = nil
                tableView.deleteRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
            } else {
                // 切换展开项
                let oldExpanded = expanded
                var newIndexPath = indexPath
                if indexPath.row > oldExpanded.row {
                    newIndexPath = IndexPath(row: indexPath.row - 1, section: 0)
                }

                expandedIndexPath = nil
                tableView.deleteRows(at: [IndexPath(row: oldExpanded.row + 1, section: 0)], with: .fade)

                expandedIndexPath = newIndexPath
                tableView.insertRows(at: [IndexPath(row: newIndexPath.row + 1, section: 0)], with: .fade)
            }
        } else {
            // 没有展开项，添加新行
            expandedIndexPath = indexPath
            tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: 0)], with: .fade)
        }

        tableView.endUpdates()
    }
}
